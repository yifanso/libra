// Copyright (c) The Libra Core Contributors
// SPDX-License-Identifier: Apache-2.0

// Note: If this test file fails to run, it is possible that the
// staged version of the Move stdlib needs to be updated. This code
// is compiled with the latest compiler and stdlib, but it runs with
// the staged stdlib.

script {
use 0x0::LibraAccount;
use 0x0::LBR::LBR;
use {{sender}}::MyModule;

fun main(account: &signer, recipient: address, amount: u64) {
    let coin = LibraAccount::withdraw_from<LBR>(account, amount);
    LibraAccount::deposit<LBR>(account, recipient, MyModule::id(coin));
}
}

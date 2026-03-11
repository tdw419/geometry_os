#!/bin/bash
# start_rust_desktop.sh - Start the Rust-native Infinite Map Compositor

cd systems/infinite_map_rs
export RUST_LOG=info
cargo run --release --bin infinite_map_rs "$@"

// lib.rs -- Geometry OS library
// Exposes VM and assembler for integration tests

pub mod assembler;
pub mod audio;
#[cfg(feature = "native")]
pub mod camera;
pub mod canvas;
pub mod cli;
pub mod embed_vmlinux;
pub mod encoding;
pub mod episode_log;
pub mod epl;
pub mod exploration;
pub mod export;
pub mod font;
pub mod forth;
pub mod framebuffer;
pub mod geo_extent;
pub mod geofs;
pub mod glyph_backend;
pub mod glyph_grid;
pub mod grammar;
pub mod hermes;
#[cfg(feature = "http")]
pub mod http_server;
pub mod inode_fs;
pub mod input_evdev;
pub mod kernel;
#[cfg(feature = "native")]
pub mod keys;
pub mod palace_device;
pub mod pathfinding;
#[allow(dead_code)]
pub mod pixel;
pub mod pixelfs;
pub mod preprocessor;
pub mod qemu;
pub mod render;
pub mod riscv;
pub mod save;
pub mod scrollback;
pub mod shell;
pub mod tile_store;
pub mod vfs;
pub mod viewport;
#[allow(dead_code)]
pub mod vision;
pub mod vm;
pub mod window_wrapper;
pub mod world_gen;

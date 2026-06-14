#![no_main]
#![no_std]

extern crate alloc;

use core::time::Duration;
use log::info;
use uefi::prelude::*;
use uefi::Identify;
use uefi::boot::{SearchType, locate_handle_buffer};
use uefi::proto::console::gop::GraphicsOutput;

#[entry]
fn main() -> Status {
    uefi::helpers::init().unwrap();

    info!("===============================================");
    info!(" Geometry OS - Phase 4: Bare Metal Bootloader  ");
    info!("===============================================");

    info!("[1/4] Initializing Graphics Output Protocol...");
    
    match locate_handle_buffer(SearchType::ByProtocol(&GraphicsOutput::GUID)) {
        Ok(handles) => {
            if handles.is_empty() {
                info!("No GOP handles found.");
            } else {
                info!("Found {} GOP handles.", handles.len());
            }
        },
        Err(e) => {
            info!("Failed to locate GOP handle: {:?}", e);
        }
    };

    info!("[2/4] Scanning PCI Bus for Target GPU (AMD/Intel)... [STUB]");
    info!("[3/4] Allocating Glyph Substrate Memory (256MB)... [STUB]");
    info!("[4/4] Exiting Boot Services and Jumping to Kernel... [STUB]");

    uefi::boot::stall(Duration::from_millis(3000));

    Status::SUCCESS
}

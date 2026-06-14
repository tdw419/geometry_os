// embedded_kernel.rs — Pixel Linux kernel embedded in the binary
//
// The RISC-V Linux kernel (~6.5MB) is compiled in at build time.
// This eliminates the runtime dependency on .geometry_os/build/linux-6.14/vmlinux.
//
// To update: cross-compile a new Pixel Linux kernel, then copy it to
//   .geometry_os/build/linux-6.14/vmlinux
// and rebuild.

/// Embedded RISC-V Linux kernel binary data.
pub static PIXEL_LINUX_KERNEL: &[u8] = include_bytes!("../.geometry_os/build/linux-6.14/vmlinux");

/// Embedded Memory Palace initramfs (if present).
pub static PIXEL_LINUX_INITRD: Option<&[u8]> = {
    // Try to embed the initramfs; if the file doesn't exist at build time,
    // we get None and boot without initrd.
    // We use a compile-time check via std::include_bytes! but wrapped:
    // Unfortunately include_bytes! doesn't fail gracefully, so we use
    // a cfg-gated approach.
    #[cfg(feature = "embed_initrd")]
    {
        Some(include_bytes!(
            "../.geometry_os/fs/linux/rv64/initramfs_mp.cpio.gz"
        ))
    }
    #[cfg(not(feature = "embed_initrd"))]
    {
        None
    }
};

/// Size of the embedded kernel in bytes.
pub const KERNEL_SIZE: usize = 6_550_776;

/// Default bootargs for Pixel Linux.
pub const DEFAULT_BOOTARGS: &str =
    "earlycon=sbi rdinit=/init nosmp loglevel=6 keep_bootcon console=ttyS0";

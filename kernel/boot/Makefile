# Geometry OS UEFI Bootloader Makefile
#
# Requires: gnu-efi package
# Ubuntu: sudo apt install gnu-efi
# Arch: sudo pacman -S gnu-efi

# Toolchain
CC = gcc
LD = ld
OBJCOPY = objcopy
AS = nasm

# UEFI headers
EFI_INCLUDE = /usr/include/efi
EFI_INCLUDE_X64 = /usr/include/efi/x86_64

# Flags
CFLAGS = -I$(EFI_INCLUDE) -I$(EFI_INCLUDE_X64) \
         -DEFI_FUNCTION_WRAPPER \
         -fPIC -fshort-wchar -ffreestanding \
         -fno-stack-protector -fno-stack-check \
         -Wall -Wextra -Werror \
         -O2

LDFLAGS = -nostdlib -znocombreloc \
          -T /usr/lib/elf_x86_64_efi.lds \
          -shared -Bsymbolic

# Files
TARGET = bootx64.efi
OBJECTS = main.o

# Kernel files
KERNEL_SRCS = kernel.c memory.c interrupt.c glyph_exec.c pci.c gpu.c ring.c glyph_compiler.c
KERNEL_OBJS = start.o kernel.o memory.o interrupt.o glyph_exec.o pci.o gpu.o ring.o glyph_compiler.o

# Build rules
all: $(TARGET)

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

main.so: $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

bootx64.efi: main.so
	$(OBJCOPY) -j .text -j .sdata -j .data \
	           -j .dynamic -j .dynsym -j .rel \
	           -j .rela -j .reloc \
	           --target=efi-app-x86_64 $< $@

# Build kernel objects
start.o: start.asm
	$(AS) -f elf64 $< -o $@

kernel.o: kernel.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

memory.o: memory.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

interrupt.o: interrupt.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

glyph_exec.o: glyph_exec.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

pci.o: pci.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

gpu.o: gpu.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

ring.o: ring.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

glyph_compiler.o: glyph_compiler.c
	$(CC) -ffreestanding -fno-stack-protector -fno-pic \
	      -mno-red-zone -mcmodel=kernel -mno-mmx -mno-sse \
	      -c $< -o $@

# Link kernel
kernel.bin: $(KERNEL_OBJS)
	$(LD) -T linker.ld $(KERNEL_OBJS) -o kernel.elf
	$(OBJCOPY) -O binary kernel.elf kernel.bin
	@echo "Kernel built: kernel.bin"
	@ls -la kernel.bin

# Create bootable USB image
boot.img: $(TARGET) kernel.bin
	@echo "Creating bootable USB image..."
	dd if=/dev/zero of=$@ bs=1M count=32
	mkfs.fat -F 32 $@
	mmd -i $@ ::/EFI
	mmd -i $@ ::/EFI/BOOT
	mcopy -i $@ $(TARGET) ::/EFI/BOOT/BOOTX64.EFI
	@if [ -f kernel.bin ]; then \
		mmd -i $@ ::/EFI/GEOS; \
		mcopy -i $@ kernel.bin ::/EFI/GEOS/kernel.bin; \
	fi
	@echo "Bootable image created: $@"
	@echo "Write to USB with: sudo dd if=$@ of=/dev/sdX bs=4M status=progress"

# Run in QEMU with OVMF
run: $(TARGET)
	@echo "Running in QEMU..."
	qemu-system-x86_64 \
		-bios /usr/share/ovmf/OVMF.fd \
		-drive file=fat:rw:boot_dir,format=raw \
		-m 256M \
		-serial stdio

# Run kernel directly in QEMU (no UEFI needed)
run-kernel: kernel.bin
	@echo "Running kernel in QEMU (direct boot)..."
	qemu-system-x86_64 \
		-kernel kernel.elf \
		-m 256M \
		-cpu qemu64 \
		-smp 1 \
		-serial stdio \
		-no-reboot \
		-no-shutdown \
		-display gtk \
		-vga std

# Run kernel in QEMU with debugging
debug-kernel: kernel.bin
	@echo "Running kernel in QEMU with GDB server..."
	qemu-system-x86_64 \
		-kernel kernel.elf \
		-m 256M \
		-s -S \
		-serial stdio \
		-no-reboot \
		-display none &
	@echo "Connect GDB with: gdb kernel.elf -ex 'target remote :1234'"

# Create GRUB bootable ISO
iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.elf iso/boot/kernel.elf
	@echo 'set timeout=3' > iso/boot/grub/grub.cfg
	@echo 'set default=0' >> iso/boot/grub/grub.cfg
	@echo 'menuentry "Geometry OS" {' >> iso/boot/grub/grub.cfg
	@echo '    multiboot2 /boot/kernel.elf' >> iso/boot/grub/grub.cfg
	@echo '    boot' >> iso/boot/grub/grub.cfg
	@echo '}' >> iso/boot/grub/grub.cfg
	grub-mkrescue -o geometry_os.iso iso
	@echo "ISO created: geometry_os.iso"

# Run ISO in QEMU
run-iso: geometry_os.iso
	qemu-system-x86_64 \
		-cdrom geometry_os.iso \
		-m 256M \
		-serial stdio \
		-no-reboot \
		-display gtk

# Create boot directory for QEMU
boot_dir:
	mkdir -p boot_dir/EFI/BOOT
	mkdir -p boot_dir/EFI/GEOS
	cp $(TARGET) boot_dir/EFI/BOOT/BOOTX64.EFI
	@if [ -f kernel.bin ]; then \
		cp kernel.bin boot_dir/EFI/GEOS/; \
	fi

# Clean
clean:
	rm -f *.o *.so *.efi *.bin *.elf boot.img
	rm -rf boot_dir

# Check dependencies
check-deps:
	@echo "Checking dependencies..."
	@test -f $(EFI_INCLUDE)/efi.h || \
		(echo "ERROR: gnu-efi not found. Install with:"; \
		 echo "  Ubuntu: sudo apt install gnu-efi"; \
		 echo "  Arch: sudo pacman -S gnu-efi"; exit 1)
	@test -f /usr/lib/elf_x86_64_efi.lds || \
		(echo "ERROR: EFI linker script not found"; exit 1)
	@echo "✓ All dependencies satisfied"

.PHONY: all clean run check-deps boot_dir

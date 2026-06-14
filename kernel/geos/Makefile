# Geometry OS Bare Metal Kernel Makefile
#
# Build: make
# Output: geometry_os.kernel

CC = gcc
LD = ld
OBJCOPY = objcopy

# Compiler flags for freestanding kernel
CFLAGS = -ffreestanding -fno-stack-protector -fno-pic -mno-red-zone \
         -mcmodel=kernel -m64 -Wall -Wextra -O2 -nostdlib -nostdinc

# Assembler flags
ASFLAGS = -ffreestanding -fno-pic -m64

# Linker flags
LDFLAGS = -nostdlib -z max-page-size=0x1000 -T link.ld

# Source files
C_SRCS = main.c amdgpu.c spirv_submit.c window_renderer.c
ASM_SRCS = entry.S

# Object files
OBJS = entry.o main.o amdgpu.o spirv_submit.o window_renderer.o

# Output
KERNEL = geometry_os.kernel

.PHONY: all clean

all: $(KERNEL)

$(KERNEL): $(OBJS) link.ld
	$(LD) $(LDFLAGS) -o $@ $(OBJS)
	@echo "Built: $(KERNEL)"
	@ls -la $(KERNEL)

main.o: main.c gpu.h
	$(CC) $(CFLAGS) -c $< -o $@

amdgpu.o: amdgpu.c gpu.h
	$(CC) $(CFLAGS) -c $< -o $@

spirv_submit.o: spirv_submit.c gpu.h
	$(CC) $(CFLAGS) -c $< -o $@

window_renderer.o: window_renderer.c window_renderer.h gpu.h
	$(CC) $(CFLAGS) -c $< -o $@

entry.o: entry.S
	$(CC) $(ASFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(KERNEL)

# Create bootable disk image
disk.img: $(KERNEL)
	dd if=/dev/zero of=$@ bs=1M count=64
	# Add UEFI bootloader and kernel

# QEMU test
qemu: $(KERNEL)
	qemu-system-x86_64 -kernel $(KERNEL) -m 512M -nographic

.PHONY: qemu

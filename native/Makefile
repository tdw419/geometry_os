# Makefile for geos_native.elf — xv6 portable C + GeOS ecall stubs
#
# Compiles unmodified xv6 portable C files (bio.c, spinlock.c, sleeplock.c)
# with thin GeOS ecall stubs into a RISC-V ELF that runs in GeOS's
# RISC-V interpreter.

TOOLPREFIX = riscv64-unknown-elf-
CC = $(TOOLPREFIX)gcc
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

# Paths
NATIVE = .
XV6_KERNEL = ../conductor/tracks/xv6-rv32/kernel
BUILD = build

# Flags
CFLAGS = -Wall -Werror -Wno-unknown-attributes -O -fno-omit-frame-pointer
CFLAGS += -march=rv32imac_zicsr
CFLAGS += -mabi=ilp32
CFLAGS += -std=gnu99
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib
CFLAGS += -I$(XV6_KERNEL)
CFLAGS += -I$(NATIVE)

LDFLAGS = -z max-page-size=4096 -m elf32lriscv

# Objects from our native port
NATIVE_OBJS = \
    $(BUILD)/geos_sys.o \
    $(BUILD)/geos_stubs.o \
    $(BUILD)/geos_main.o \
    $(BUILD)/swtch.o

# Objects from xv6 portable C (compiled unmodified)
XV6_OBJS = \
    $(BUILD)/bio.o \
    $(BUILD)/spinlock.o \
    $(BUILD)/sleeplock.o \
    $(BUILD)/fs.o \
    $(BUILD)/file.o \
    $(BUILD)/pipe.o \
    $(BUILD)/log.o \
    $(BUILD)/string.o \
    $(BUILD)/sysfile.o \
    $(BUILD)/sysproc.o \
    $(BUILD)/syscall.o \
    $(BUILD)/console.o

ALL_OBJS = $(NATIVE_OBJS) $(XV6_OBJS)

# Default target
all: $(BUILD)/geos_native.elf $(BUILD)/geos_native.bin

# Link
$(BUILD)/geos_native.elf: $(ALL_OBJS) geos_native.ld
	@mkdir -p $(BUILD)
	$(LD) $(LDFLAGS) -T geos_native.ld -o $@ $(ALL_OBJS)
	@$(OBJCOPY) --only-section=.text --only-section=.rodata --only-section=.data --only-section=.bss -O binary $@ $(BUILD)/geos_native.text.bin 2>/dev/null; true
	$(OBJDUMP) -S $@ > $(BUILD)/geos_native.asm
	$(OBJDUMP) -t $@ | sort > $(BUILD)/geos_native.sym
	@echo "=== geos_native.elf built successfully ==="
	@$(OBJDUMP) -t $@ | grep -E "_entry|geos_main|kalloc_impl|disk_read_impl|binit|bread" || true

# Binary (raw) for direct loading
$(BUILD)/geos_native.bin: $(BUILD)/geos_native.elf
	$(OBJCOPY) -O binary $< $@
	@echo "Binary size: $$(wc -c < $@) bytes"

# Native stubs
$(BUILD)/geos_sys.o: geos_sys.S
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/geos_stubs.o: geos_stubs.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/geos_main.o: geos_main.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/swtch.o: swtch.S
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

# xv6 portable C files (compiled as-is from the xv6 tree)
$(BUILD)/bio.o: $(XV6_KERNEL)/bio.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/spinlock.o: $(XV6_KERNEL)/spinlock.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/sleeplock.o: $(XV6_KERNEL)/sleeplock.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/fs.o: $(XV6_KERNEL)/fs.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/file.o: $(XV6_KERNEL)/file.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/pipe.o: $(XV6_KERNEL)/pipe.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/log.o: $(XV6_KERNEL)/log.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/string.o: $(XV6_KERNEL)/string.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/sysfile.o: $(XV6_KERNEL)/sysfile.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/sysproc.o: $(XV6_KERNEL)/sysproc.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/syscall.o: $(NATIVE)/syscall_patched.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD)/console.o: $(NATIVE)/console.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean
clean:
	rm -rf $(BUILD)

.PHONY: all clean

# Geometry OS Bare Metal Kernel Makefile
#
# Build: make
# Output: geometry_os.kernel

AS = nasm
CC = gcc
LD = ld

# Directories
BUILD_DIR = build
SRC_DIR = src

# Compiler flags
CFLAGS = -ffreestanding -fno-stack-protector -fno-pic -mno-red-zone \
        -mcmodel=kernel -m64 -Wall -Wextra -O2

ASFLAGS = -f elf64
LDFLAGS = -nostdlib -z max-page-size=0x1000

# Source files
C_SRCS = main.c
ASM_SRCS = entry.S

# Object files
C_OBJS = $(C_SRCS:.c=$(BUILD_DIR)/%.o)
ASM_OBJS = $(ASM_SRCS:.S=$(BUILD_DIR)/%.o)
OBJS = $(C_OBJS) $(ASM_OBJS)

# Output
KERNEL = geometry_os.kernel

.PHONY: all clean

all: $(BUILD_DIR) $(KERNEL)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(KERNEL): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.S
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(KERNEL)

# Debug build
debug: CFLAGS += -g -DDEBUG
debug: clean all

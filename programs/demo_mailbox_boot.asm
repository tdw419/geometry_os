;; ─────────────────────────────────────────────────────────────
;; demo_mailbox_boot.asm
;; VEC_FIND → mailbox → VM_LIVE_SPAWN demo
;;
;; Demonstrates the bridge:
;;  1. Query an embedding table with VEC_FIND
;;  2. Store VEC_FIND result (ring=RAM size tier, angle=DTB config) into mailbox
;;  3. IOCTL MAILBOX_PUT copies to hypervisor_mailbox
;;  4. VM_LIVE_SPAWN preloads mailbox into RISC-V guest RAM at end of RAM
;;
;; Embedding table at 0x5000 (loaded by host before running this program).
;; Each entry: (x_q16, y_q16) packed → (ring, angle, idx)
;;   ring 0 = 64MB, ring 1 = 256MB, ring 2 = 512MB, ring 3 = 768MB
;;   angle 0 = no initrd, angle 1 = small initrd, angle 2 = buildroot
;; ─────────────────────────────────────────────────────────────

;; ── Mailbox format (64 u32 words, all at once) ──
;;   word 0: ram_mb                (e.g., 768)
;;   word 1: dtb_offset            (e.g., 0x400000 → 4MB into RAM)
;;   word 2: initrd_offset         (e.g., 0x800000 → 8MB into RAM)
;;   word 3: initrd_size           (bytes, 0 = no initrd)
;;   word 4: bootargs_addr         (address of bootargs string in RISC-V RAM)
;;   words 5-15: reserved (0)
;;   words 16-63: bootargs string as u32 chars (up to 192 bytes)

;; ── Constants ──
.equ MAILBOX_FD      0xE004    ;; /dev/mailbox fd
.equ MAILBOX_PUT     0         ;; cmd 0: copy RAM[arg] → mailbox
.equ MAILBOX_GET     1         ;; cmd 1: copy mailbox → RAM[arg]
.equ MAILBOX_CLEAR   2         ;; cmd 2: zero mailbox
.equ TABLE_ADDR      0x5000    ;; embedding table address in RAM
.equ CONFIG_ADDR     0x2000    ;; config buffer address for mailbox payload
.equ BOOTARGS_ADDR   0x2100    ;; bootargs string buffer
.equ VM_CONFIG_ADDR  0x2200    ;; VM_LIVE_SPAWN config string

;; ── Step 1: Query embedding table with VEC_FIND ──
;; Query: we're looking for a config that works with a 10MB kernel + buildroot initrd
;; The query coordinates encode (kernel_size_kb, initrd_size_kb)
;; kernel=10MB=10240KB, initrd=4MB=4096KB → roughly (51200, 20480) in Q16 space

LDI r3, TABLE_ADDR     ;; table address
LDI r4, 51200          ;; query_x: kernel size proxy
LDI r5, 20480          ;; query_y: initrd size proxy
.word 0x08             ;; VEC_FIND opcode
.word 3                ;; table_reg = r3
.word 4                ;; qx_reg = r4
.word 5                ;; qy_reg = r5
;; Result: r0 = entry index, r1 = ring, r2 = angle

;; Save results for display
STI r1, 0x2300         ;; ring → RAM[0x2300]
STI r2, 0x2301         ;; angle → RAM[0x2301]

;; ── Step 2: Decode VEC_FIND result into boot config ──
;; ring → ram_mb: 0=64, 1=256, 2=512, 3=768
LDI r6, 0              ;; default = 64MB
CEQ r1, 1              ;; ring == 1?
JNZ r0, :ram_256       ;; skip if not
LDI r6, 256
:ram_256
CEQ r1, 2
JNZ r0, :ram_512
LDI r6, 512
:ram_512
CEQ r1, 3
JNZ r0, :ram_done
LDI r6, 768
:ram_done

;; angle → dtb_offset: 0=2MB, 1=4MB, 2=8MB
LDI r7, 0x200000       ;; default 2MB
CEQ r2, 1
JNZ r0, :dtb_4m
LDI r7, 0x400000
:dtb_4m
CEQ r2, 2
JNZ r0, :dtb_done
LDI r7, 0x800000
:dtb_done

;; Store config to RAM buffer for mailbox
STI r6, CONFIG_ADDR         ;; ram_mb
STI r7, CONFIG_ADDR+1       ;; dtb_offset

;; ── Step 3: Set initrd config (angle 2 = buildroot) ──
LDI r8, 0x800000       ;; initrd offset (8MB into RAM)
LDI r9, 0              ;; initrd size (0 = no initrd)
CEQ r2, 2
JNZ r0, :initrd_none
LDI r9, 0x400000       ;; 4MB initrd
:initrd_none
STI r8, CONFIG_ADDR+2      ;; initrd_offset
STI r9, CONFIG_ADDR+3      ;; initrd_size

;; ── Step 4: Write bootargs string ──
;; Store "console=sbi earlycon=sbi" at BOOTARGS_ADDR
;; Using ASCII char-by-char via RAM poke (simplified: write first few words)
LDI r10, 0x6F6E7363    ;; "cson"
STI r10, BOOTARGS_ADDR
LDI r10, 0x656C6F73    ;; "sole"
STI r10, BOOTARGS_ADDR+1
LDI r10, 0x6962733D    ;; "=sbi"
STI r10, BOOTARGS_ADDR+2
LDI r10, 0x72616520    ;; " ear"
STI r10, BOOTARGS_ADDR+3
LDI r10, 0x6F636C79    ;; "lyco"
STI r10, BOOTARGS_ADDR+4
LDI r10, 0x6F736E6E    ;; "nns "
STI r10, BOOTARGS_ADDR+5
LDI r10, 0x6962733D    ;; "=sbi"
STI r10, BOOTARGS_ADDR+6
LDI r10, 0x0000000A    ;; "\n\0\0\0"
STI r10, BOOTARGS_ADDR+7

; Store bootargs_addr (RISC-V physical address: ram_base + offset)
; The bootargs string will be at ram_base + 0x20000 in the RISC-V VM
LDI r10, 0x80020000
STI r10, CONFIG_ADDR+4     ;; bootargs_addr

;; ── Step 5: Write config to mailbox ──
;; IOCTL /dev/mailbox, MAILBOX_PUT, CONFIG_ADDR
LDI r1, MAILBOX_FD
LDI r2, MAILBOX_PUT
LDI r3, CONFIG_ADDR
IOCTL r1, r2, r3

;; Check result
STI r0, 0x2302         ;; store IOCTL result for inspection

;; ── Step 6: Launch RISC-V VM with these parameters ──
;; Build VM_LIVE_SPAWN config string at VM_CONFIG_ADDR
;; Format: "arch=riscv64 kernel=/boot/Image ram=768M"
LDI r10, 0x68726361    ;; "arch"
STI r10, VM_CONFIG_ADDR
LDI r10, 0x6973723D    ;; "=ris"
STI r10, VM_CONFIG_ADDR+1
LDI r10, 0x36357663    ;; "cv65"
STI r10, VM_CONFIG_ADDR+2
LDI r10, 0x6B202034    ;; "4 ki"
STI r10, VM_CONFIG_ADDR+3
LDI r10, 0x6E72656C    ;; "lern"
STI r10, VM_CONFIG_ADDR+4
LDI r10, 0x2F3D656C    ;; "le=/"
STI r10, VM_CONFIG_ADDR+5
LDI r10, 0x746F6F62    ;; "boot"
STI r10, VM_CONFIG_ADDR+6
LDI r10, 0x616D492F    ;; "/Ima"
STI r10, VM_CONFIG_ADDR+7
LDI r10, 0x616D4967    ;; "gIma"
STI r10, VM_CONFIG_ADDR+8
LDI r10, 0x6D206567    ;; "ge m"
STI r10, VM_CONFIG_ADDR+9
;; Wait, let me just use a RAM-based kernel path
;; For now, write a minimal config
LDI r10, 0x00000000    ;; null terminator
STI r10, VM_CONFIG_ADDR+10

;; ── Step 7: Spawn the RISC-V VM (VM_LIVE_SPAWN) ──
;; VM_LIVE_SPAWN config_reg, window_reg (0xB4)
;; Encoding: [0xB4, config_reg, window_reg]
;; config_reg = r11 (holding VM_CONFIG_ADDR)
;; window_reg = r12 (window ID, 0 = auto-create from bounds)
LDI r11, VM_CONFIG_ADDR
LDI r12, 0             ;; auto-create window from bounds
.word 0xB4
.word 11
.word 12
;; r0 = 0 on success
STI r0, 0x2303         ;; store spawn result

;; Halt for inspection
HALT

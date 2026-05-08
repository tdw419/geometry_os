; DESCRIPTION: A colored object centered at the screen with fixed size.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r13, 0x1000
LDI r1, 104      ; h
STORE r13, r1
LDI r13, 0x1001
LDI r1, 101      ; e
STORE r13, r1
LDI r13, 0x1002
LDI r1, 108      ; l
STORE r13, r1
LDI r13, 0x1003
LDI r1, 108      ; l
STORE r13, r1
LDI r13, 0x1004
LDI r1, 111      ; o
STORE r13, r1
LDI r13, 0x1005
LDI r1, 46       ; .
STORE r13, r1
LDI r13, 0x1006
LDI r1, 116      ; t
STORE r13, r1
LDI r13, 0x1007
LDI r1, 120      ; x
STORE r13, r1
LDI r13, 0x1008
LDI r1, 116      ; t
STORE r13, r1
LDI r13, 0x1009
LDI r1, 0        ; null terminator
STORE r13, r1

; ── Open file for reading (mode 0 = read) ──
LDI r3, 0x1000   ; r3 = pointer to filename
LDI r5, 0        ; r5 = mode (read)
OPEN r3, r5       ; r1 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r4, r1       ; r4 = saved fd
LDI r15, 0x2000   ; r15 = read buffer address
LDI r6, 200      ; r6 = max bytes to read
READ r4, r15, r6  ; r1 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r1 = 0xFFFFFFFF)
LDI r0, 200
CMP r1, r0
BLT r1, do_terminate
LDI r1, 200
do_terminate:
LDI r0, 0x2000   ; buffer start
ADD r1, r0       ; r1 = buffer start + bytes_read = end address
LDI r11, 0
STORE r1, r11     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r3, 2        ; x position
LDI r5, 10       ; y position
LDI r15, 0x2000   ; pointer to string buffer
TEXT r3, r5, r15

; ── Close the file ──
CLOSE r4
HALT

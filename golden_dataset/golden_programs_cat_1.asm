; DESCRIPTION: This GeOS assembly code reads the contents of "hello.txt" from the virtual filesystem (VFS) and displays it on the screen at coordinates (2, 10). It uses the OPEN, READ, CLOSE opcodes to handle file operations. If the file doesn't exist, the program halts cleanly without displaying anything.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r14, 0x1000
LDI r3, 104      ; h
STORE r14, r3
LDI r14, 0x1001
LDI r3, 101      ; e
STORE r14, r3
LDI r14, 0x1002
LDI r3, 108      ; l
STORE r14, r3
LDI r14, 0x1003
LDI r3, 108      ; l
STORE r14, r3
LDI r14, 0x1004
LDI r3, 111      ; o
STORE r14, r3
LDI r14, 0x1005
LDI r3, 46       ; .
STORE r14, r3
LDI r14, 0x1006
LDI r3, 116      ; t
STORE r14, r3
LDI r14, 0x1007
LDI r3, 120      ; x
STORE r14, r3
LDI r14, 0x1008
LDI r3, 116      ; t
STORE r14, r3
LDI r14, 0x1009
LDI r3, 0        ; null terminator
STORE r14, r3

; ── Open file for reading (mode 0 = read) ──
LDI r11, 0x1000   ; r11 = pointer to filename
LDI r12, 0        ; r12 = mode (read)
OPEN r11, r12       ; r3 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r7, r3       ; r7 = saved fd
LDI r10, 0x2000   ; r10 = read buffer address
LDI r4, 200      ; r4 = max bytes to read
READ r7, r10, r4  ; r3 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r3 = 0xFFFFFFFF)
LDI r6, 200
CMP r3, r6
BLT r3, do_terminate
LDI r3, 200
do_terminate:
LDI r6, 0x2000   ; buffer start
ADD r3, r6       ; r3 = buffer start + bytes_read = end address
LDI r0, 0
STORE r3, r0     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r11, 2        ; x position
LDI r12, 10       ; y position
LDI r10, 0x2000   ; pointer to string buffer
TEXT r11, r12, r10

; ── Close the file ──
CLOSE r7
HALT

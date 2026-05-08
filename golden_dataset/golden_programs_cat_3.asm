; DESCRIPTION: Draws a colored object at the screen with fixed size.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r4, 0x1000
LDI r1, 104      ; h
STORE r4, r1
LDI r4, 0x1001
LDI r1, 101      ; e
STORE r4, r1
LDI r4, 0x1002
LDI r1, 108      ; l
STORE r4, r1
LDI r4, 0x1003
LDI r1, 108      ; l
STORE r4, r1
LDI r4, 0x1004
LDI r1, 111      ; o
STORE r4, r1
LDI r4, 0x1005
LDI r1, 46       ; .
STORE r4, r1
LDI r4, 0x1006
LDI r1, 116      ; t
STORE r4, r1
LDI r4, 0x1007
LDI r1, 120      ; x
STORE r4, r1
LDI r4, 0x1008
LDI r1, 116      ; t
STORE r4, r1
LDI r4, 0x1009
LDI r1, 0        ; null terminator
STORE r4, r1

; ── Open file for reading (mode 0 = read) ──
LDI r9, 0x1000   ; r9 = pointer to filename
LDI r13, 0        ; r13 = mode (read)
OPEN r9, r13       ; r1 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r12, r1       ; r12 = saved fd
LDI r7, 0x2000   ; r7 = read buffer address
LDI r6, 200      ; r6 = max bytes to read
READ r12, r7, r6  ; r1 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r1 = 0xFFFFFFFF)
LDI r3, 200
CMP r1, r3
BLT r1, do_terminate
LDI r1, 200
do_terminate:
LDI r3, 0x2000   ; buffer start
ADD r1, r3       ; r1 = buffer start + bytes_read = end address
LDI r0, 0
STORE r1, r0     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r9, 2        ; x position
LDI r13, 10       ; y position
LDI r7, 0x2000   ; pointer to string buffer
TEXT r9, r13, r7

; ── Close the file ──
CLOSE r12
HALT

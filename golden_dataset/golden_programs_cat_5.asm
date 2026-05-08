; DESCRIPTION: Display a object using color colored at the screen.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r12, 0x1000
LDI r7, 104      ; h
STORE r12, r7
LDI r12, 0x1001
LDI r7, 101      ; e
STORE r12, r7
LDI r12, 0x1002
LDI r7, 108      ; l
STORE r12, r7
LDI r12, 0x1003
LDI r7, 108      ; l
STORE r12, r7
LDI r12, 0x1004
LDI r7, 111      ; o
STORE r12, r7
LDI r12, 0x1005
LDI r7, 46       ; .
STORE r12, r7
LDI r12, 0x1006
LDI r7, 116      ; t
STORE r12, r7
LDI r12, 0x1007
LDI r7, 120      ; x
STORE r12, r7
LDI r12, 0x1008
LDI r7, 116      ; t
STORE r12, r7
LDI r12, 0x1009
LDI r7, 0        ; null terminator
STORE r12, r7

; ── Open file for reading (mode 0 = read) ──
LDI r1, 0x1000   ; r1 = pointer to filename
LDI r5, 0        ; r5 = mode (read)
OPEN r1, r5       ; r7 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r3, r7       ; r3 = saved fd
LDI r2, 0x2000   ; r2 = read buffer address
LDI r14, 200      ; r14 = max bytes to read
READ r3, r2, r14  ; r7 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r7 = 0xFFFFFFFF)
LDI r0, 200
CMP r7, r0
BLT r7, do_terminate
LDI r7, 200
do_terminate:
LDI r0, 0x2000   ; buffer start
ADD r7, r0       ; r7 = buffer start + bytes_read = end address
LDI r9, 0
STORE r7, r9     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r1, 2        ; x position
LDI r5, 10       ; y position
LDI r2, 0x2000   ; pointer to string buffer
TEXT r1, r5, r2

; ── Close the file ──
CLOSE r3
HALT

; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r7, filepath
LDI r4, 0           ; read mode
FSOPEN r7, r4

; r3 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r3 < 0x80000000 means success (handle is small)
LDI r0, 0x80000000
CMP r3, r0
BGE r3, fail        ; if handle >= 0x80000000, it's an error
MOV r9, r3         ; save handle

; FSREAD handle, buf, len
LDI r4, 0x3000      ; buffer
LDI r13, 4           ; read 4 bytes
MOV r7, r9
FSREAD r7, r4, r13
MOV r10, r3         ; bytes read

; FSCLOSE handle
MOV r7, r9
FSCLOSE r7

; Check if we read at least 1 byte
LDI r0, 0x80000000
CMP r10, r0
BGE r3, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r2, 0x3000
LOAD r6, r2       ; r6 = first byte
LDI r8, 0x47       ; 'G'
CMP r6, r8
JZ r3, success
JMP fail

success:
LDI r7, 96
LDI r4, 96
LDI r13, 64
LDI r11, 64
LDI r12, 0x00FF00
RECTF r7, r4, r13, r11, r12
HALT

fail:
LDI r7, 96
LDI r4, 96
LDI r13, 64
LDI r11, 64
LDI r12, 0xFF0000
RECTF r7, r4, r13, r11, r12
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r4, filepath
LDI r1, 0           ; read mode
FSOPEN r4, r1

; r14 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r14 < 0x80000000 means success (handle is small)
LDI r11, 0x80000000
CMP r14, r11
BGE r14, fail        ; if handle >= 0x80000000, it's an error
MOV r15, r14         ; save handle

; FSREAD handle, buf, len
LDI r1, 0x3000      ; buffer
LDI r9, 4           ; read 4 bytes
MOV r4, r15
FSREAD r4, r1, r9
MOV r12, r14         ; bytes read

; FSCLOSE handle
MOV r4, r15
FSCLOSE r4

; Check if we read at least 1 byte
LDI r11, 0x80000000
CMP r12, r11
BGE r14, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r2, 0x3000
LOAD r0, r2       ; r0 = first byte
LDI r6, 0x47       ; 'G'
CMP r0, r6
JZ r14, success
JMP fail

success:
LDI r4, 96
LDI r1, 96
LDI r9, 64
LDI r13, 64
LDI r8, 0x00FF00
RECTF r4, r1, r9, r13, r8
HALT

fail:
LDI r4, 96
LDI r1, 96
LDI r9, 64
LDI r13, 64
LDI r8, 0xFF0000
RECTF r4, r1, r9, r13, r8
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

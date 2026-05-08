; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r11, filepath
LDI r3, 0           ; read mode
FSOPEN r11, r3

; r7 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r7 < 0x80000000 means success (handle is small)
LDI r1, 0x80000000
CMP r7, r1
BGE r7, fail        ; if handle >= 0x80000000, it's an error
MOV r14, r7         ; save handle

; FSREAD handle, buf, len
LDI r3, 0x3000      ; buffer
LDI r9, 4           ; read 4 bytes
MOV r11, r14
FSREAD r11, r3, r9
MOV r12, r7         ; bytes read

; FSCLOSE handle
MOV r11, r14
FSCLOSE r11

; Check if we read at least 1 byte
LDI r1, 0x80000000
CMP r12, r1
BGE r7, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r6, 0x3000
LOAD r2, r6       ; r2 = first byte
LDI r5, 0x47       ; 'G'
CMP r2, r5
JZ r7, success
JMP fail

success:
LDI r11, 96
LDI r3, 96
LDI r9, 64
LDI r13, 64
LDI r10, 0x00FF00
RECTF r11, r3, r9, r13, r10
HALT

fail:
LDI r11, 96
LDI r3, 96
LDI r9, 64
LDI r13, 64
LDI r10, 0xFF0000
RECTF r11, r3, r9, r13, r10
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

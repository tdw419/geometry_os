; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r6, filepath
LDI r11, 0           ; read mode
FSOPEN r6, r11

; r1 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r1 < 0x80000000 means success (handle is small)
LDI r9, 0x80000000
CMP r1, r9
BGE r1, fail        ; if handle >= 0x80000000, it's an error
MOV r2, r1         ; save handle

; FSREAD handle, buf, len
LDI r11, 0x3000      ; buffer
LDI r7, 4           ; read 4 bytes
MOV r6, r2
FSREAD r6, r11, r7
MOV r3, r1         ; bytes read

; FSCLOSE handle
MOV r6, r2
FSCLOSE r6

; Check if we read at least 1 byte
LDI r9, 0x80000000
CMP r3, r9
BGE r1, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r5, 0x3000
LOAD r8, r5       ; r8 = first byte
LDI r10, 0x47       ; 'G'
CMP r8, r10
JZ r1, success
JMP fail

success:
LDI r6, 96
LDI r11, 96
LDI r7, 64
LDI r14, 64
LDI r12, 0x00FF00
RECTF r6, r11, r7, r14, r12
HALT

fail:
LDI r6, 96
LDI r11, 96
LDI r7, 64
LDI r14, 64
LDI r12, 0xFF0000
RECTF r6, r11, r7, r14, r12
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

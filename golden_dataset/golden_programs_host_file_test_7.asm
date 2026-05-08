; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r7, filepath
LDI r11, 0           ; read mode
FSOPEN r7, r11

; r6 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r6 < 0x80000000 means success (handle is small)
LDI r8, 0x80000000
CMP r6, r8
BGE r6, fail        ; if handle >= 0x80000000, it's an error
MOV r9, r6         ; save handle

; FSREAD handle, buf, len
LDI r11, 0x3000      ; buffer
LDI r2, 4           ; read 4 bytes
MOV r7, r9
FSREAD r7, r11, r2
MOV r13, r6         ; bytes read

; FSCLOSE handle
MOV r7, r9
FSCLOSE r7

; Check if we read at least 1 byte
LDI r8, 0x80000000
CMP r13, r8
BGE r6, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r1, 0x3000
LOAD r0, r1       ; r0 = first byte
LDI r3, 0x47       ; 'G'
CMP r0, r3
JZ r6, success
JMP fail

success:
LDI r7, 96
LDI r11, 96
LDI r2, 64
LDI r5, 64
LDI r14, 0x00FF00
RECTF r7, r11, r2, r5, r14
HALT

fail:
LDI r7, 96
LDI r11, 96
LDI r2, 64
LDI r5, 64
LDI r14, 0xFF0000
RECTF r7, r11, r2, r5, r14
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

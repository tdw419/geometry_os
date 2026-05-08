; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r5, filepath
LDI r2, 0           ; read mode
FSOPEN r5, r2

; r14 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r14 < 0x80000000 means success (handle is small)
LDI r13, 0x80000000
CMP r14, r13
BGE r14, fail        ; if handle >= 0x80000000, it's an error
MOV r9, r14         ; save handle

; FSREAD handle, buf, len
LDI r2, 0x3000      ; buffer
LDI r10, 4           ; read 4 bytes
MOV r5, r9
FSREAD r5, r2, r10
MOV r8, r14         ; bytes read

; FSCLOSE handle
MOV r5, r9
FSCLOSE r5

; Check if we read at least 1 byte
LDI r13, 0x80000000
CMP r8, r13
BGE r14, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r1, 0x3000
LOAD r15, r1       ; r15 = first byte
LDI r6, 0x47       ; 'G'
CMP r15, r6
JZ r14, success
JMP fail

success:
LDI r5, 96
LDI r2, 96
LDI r10, 64
LDI r11, 64
LDI r7, 0x00FF00
RECTF r5, r2, r10, r11, r7
HALT

fail:
LDI r5, 96
LDI r2, 96
LDI r10, 64
LDI r11, 64
LDI r7, 0xFF0000
RECTF r5, r2, r10, r11, r7
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

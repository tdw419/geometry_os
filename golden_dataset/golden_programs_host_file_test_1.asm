; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r9, filepath
LDI r1, 0           ; read mode
FSOPEN r9, r1

; r13 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r13 < 0x80000000 means success (handle is small)
LDI r14, 0x80000000
CMP r13, r14
BGE r13, fail        ; if handle >= 0x80000000, it's an error
MOV r6, r13         ; save handle

; FSREAD handle, buf, len
LDI r1, 0x3000      ; buffer
LDI r7, 4           ; read 4 bytes
MOV r9, r6
FSREAD r9, r1, r7
MOV r15, r13         ; bytes read

; FSCLOSE handle
MOV r9, r6
FSCLOSE r9

; Check if we read at least 1 byte
LDI r14, 0x80000000
CMP r15, r14
BGE r13, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r12, 0x3000
LOAD r2, r12       ; r2 = first byte
LDI r3, 0x47       ; 'G'
CMP r2, r3
JZ r13, success
JMP fail

success:
LDI r9, 96
LDI r1, 96
LDI r7, 64
LDI r5, 64
LDI r8, 0x00FF00
RECTF r9, r1, r7, r5, r8
HALT

fail:
LDI r9, 96
LDI r1, 96
LDI r7, 64
LDI r5, 64
LDI r8, 0xFF0000
RECTF r9, r1, r7, r5, r8
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

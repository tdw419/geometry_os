; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r14, filepath
LDI r7, 0           ; read mode
FSOPEN r14, r7

; r6 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r6 < 0x80000000 means success (handle is small)
LDI r9, 0x80000000
CMP r6, r9
BGE r6, fail        ; if handle >= 0x80000000, it's an error
MOV r10, r6         ; save handle

; FSREAD handle, buf, len
LDI r7, 0x3000      ; buffer
LDI r1, 4           ; read 4 bytes
MOV r14, r10
FSREAD r14, r7, r1
MOV r8, r6         ; bytes read

; FSCLOSE handle
MOV r14, r10
FSCLOSE r14

; Check if we read at least 1 byte
LDI r9, 0x80000000
CMP r8, r9
BGE r6, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r4, 0x3000
LOAD r3, r4       ; r3 = first byte
LDI r15, 0x47       ; 'G'
CMP r3, r15
JZ r6, success
JMP fail

success:
LDI r14, 96
LDI r7, 96
LDI r1, 64
LDI r5, 64
LDI r13, 0x00FF00
RECTF r14, r7, r1, r5, r13
HALT

fail:
LDI r14, 96
LDI r7, 96
LDI r1, 64
LDI r5, 64
LDI r13, 0xFF0000
RECTF r14, r7, r1, r5, r13
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

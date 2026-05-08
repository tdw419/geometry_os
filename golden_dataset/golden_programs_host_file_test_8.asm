; DESCRIPTION: This GeOS assembly code reads the first four bytes of a specified test file and checks if the content is "GEOS". If successful, it draws a green rectangle on the screen; otherwise, it draws a red rectangle.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r8, filepath
LDI r6, 0           ; read mode
FSOPEN r8, r6

; r12 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r12 < 0x80000000 means success (handle is small)
LDI r14, 0x80000000
CMP r12, r14
BGE r12, fail        ; if handle >= 0x80000000, it's an error
MOV r7, r12         ; save handle

; FSREAD handle, buf, len
LDI r6, 0x3000      ; buffer
LDI r0, 4           ; read 4 bytes
MOV r8, r7
FSREAD r8, r6, r0
MOV r4, r12         ; bytes read

; FSCLOSE handle
MOV r8, r7
FSCLOSE r8

; Check if we read at least 1 byte
LDI r14, 0x80000000
CMP r4, r14
BGE r12, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r15, 0x3000
LOAD r3, r15       ; r3 = first byte
LDI r10, 0x47       ; 'G'
CMP r3, r10
JZ r12, success
JMP fail

success:
LDI r8, 96
LDI r6, 96
LDI r0, 64
LDI r5, 64
LDI r11, 0x00FF00
RECTF r8, r6, r0, r5, r11
HALT

fail:
LDI r8, 96
LDI r6, 96
LDI r0, 64
LDI r5, 64
LDI r11, 0xFF0000
RECTF r8, r6, r0, r5, r11
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

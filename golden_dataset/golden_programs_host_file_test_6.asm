; DESCRIPTION: Display a rectangle using color red at the screen.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r6, filepath
LDI r8, 0           ; read mode
FSOPEN r6, r8

; r7 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r7 < 0x80000000 means success (handle is small)
LDI r15, 0x80000000
CMP r7, r15
BGE r7, fail        ; if handle >= 0x80000000, it's an error
MOV r14, r7         ; save handle

; FSREAD handle, buf, len
LDI r8, 0x3000      ; buffer
LDI r12, 4           ; read 4 bytes
MOV r6, r14
FSREAD r6, r8, r12
MOV r1, r7         ; bytes read

; FSCLOSE handle
MOV r6, r14
FSCLOSE r6

; Check if we read at least 1 byte
LDI r15, 0x80000000
CMP r1, r15
BGE r7, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r9, 0x3000
LOAD r0, r9       ; r0 = first byte
LDI r13, 0x47       ; 'G'
CMP r0, r13
JZ r7, success
JMP fail

success:
LDI r6, 96
LDI r8, 96
LDI r12, 64
LDI r5, 64
LDI r11, 0x00FF00
RECTF r6, r8, r12, r5, r11
HALT

fail:
LDI r6, 96
LDI r8, 96
LDI r12, 64
LDI r5, 64
LDI r11, 0xFF0000
RECTF r6, r8, r12, r5, r11
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r8, filepath
LDI r6, 0           ; read mode
FSOPEN r8, r6

; r11 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r11 < 0x80000000 means success (handle is small)
LDI r14, 0x80000000
CMP r11, r14
BGE r11, fail        ; if handle >= 0x80000000, it's an error
MOV r1, r11         ; save handle

; FSREAD handle, buf, len
LDI r6, 0x3000      ; buffer
LDI r10, 4           ; read 4 bytes
MOV r8, r1
FSREAD r8, r6, r10
MOV r7, r11         ; bytes read

; FSCLOSE handle
MOV r8, r1
FSCLOSE r8

; Check if we read at least 1 byte
LDI r14, 0x80000000
CMP r7, r14
BGE r11, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r5, 0x3000
LOAD r9, r5       ; r9 = first byte
LDI r15, 0x47       ; 'G'
CMP r9, r15
JZ r11, success
JMP fail

success:
LDI r8, 96
LDI r6, 96
LDI r10, 64
LDI r3, 64
LDI r13, 0x00FF00
RECTF r8, r6, r10, r3, r13
HALT

fail:
LDI r8, 96
LDI r6, 96
LDI r10, 64
LDI r3, 64
LDI r13, 0xFF0000
RECTF r8, r6, r10, r3, r13
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

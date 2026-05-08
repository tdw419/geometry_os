; DESCRIPTION: Render a red rectangle at the screen.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r4, filepath
LDI r9, 0           ; read mode
FSOPEN r4, r9

; r7 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r7 < 0x80000000 means success (handle is small)
LDI r2, 0x80000000
CMP r7, r2
BGE r7, fail        ; if handle >= 0x80000000, it's an error
MOV r12, r7         ; save handle

; FSREAD handle, buf, len
LDI r9, 0x3000      ; buffer
LDI r8, 4           ; read 4 bytes
MOV r4, r12
FSREAD r4, r9, r8
MOV r5, r7         ; bytes read

; FSCLOSE handle
MOV r4, r12
FSCLOSE r4

; Check if we read at least 1 byte
LDI r2, 0x80000000
CMP r5, r2
BGE r7, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r3, 0x3000
LOAD r6, r3       ; r6 = first byte
LDI r11, 0x47       ; 'G'
CMP r6, r11
JZ r7, success
JMP fail

success:
LDI r4, 96
LDI r9, 96
LDI r8, 64
LDI r0, 64
LDI r15, 0x00FF00
RECTF r4, r9, r8, r0, r15
HALT

fail:
LDI r4, 96
LDI r9, 96
LDI r8, 64
LDI r0, 64
LDI r15, 0xFF0000
RECTF r4, r9, r8, r0, r15
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

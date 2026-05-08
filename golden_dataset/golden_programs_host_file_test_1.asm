; DESCRIPTION: Render a red rectangle at the screen.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r12, filepath
LDI r13, 0           ; read mode
FSOPEN r12, r13

; r2 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r2 < 0x80000000 means success (handle is small)
LDI r10, 0x80000000
CMP r2, r10
BGE r2, fail        ; if handle >= 0x80000000, it's an error
MOV r0, r2         ; save handle

; FSREAD handle, buf, len
LDI r13, 0x3000      ; buffer
LDI r1, 4           ; read 4 bytes
MOV r12, r0
FSREAD r12, r13, r1
MOV r4, r2         ; bytes read

; FSCLOSE handle
MOV r12, r0
FSCLOSE r12

; Check if we read at least 1 byte
LDI r10, 0x80000000
CMP r4, r10
BGE r2, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r3, 0x3000
LOAD r5, r3       ; r5 = first byte
LDI r9, 0x47       ; 'G'
CMP r5, r9
JZ r2, success
JMP fail

success:
LDI r12, 96
LDI r13, 96
LDI r1, 64
LDI r11, 64
LDI r6, 0x00FF00
RECTF r12, r13, r1, r11, r6
HALT

fail:
LDI r12, 96
LDI r13, 96
LDI r1, 64
LDI r11, 64
LDI r6, 0xFF0000
RECTF r12, r13, r1, r11, r6
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

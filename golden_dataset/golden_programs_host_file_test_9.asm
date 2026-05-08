; DESCRIPTION: Render a red rectangle at the screen.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r8, filepath
LDI r4, 0           ; read mode
FSOPEN r8, r4

; r9 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r9 < 0x80000000 means success (handle is small)
LDI r1, 0x80000000
CMP r9, r1
BGE r9, fail        ; if handle >= 0x80000000, it's an error
MOV r0, r9         ; save handle

; FSREAD handle, buf, len
LDI r4, 0x3000      ; buffer
LDI r2, 4           ; read 4 bytes
MOV r8, r0
FSREAD r8, r4, r2
MOV r7, r9         ; bytes read

; FSCLOSE handle
MOV r8, r0
FSCLOSE r8

; Check if we read at least 1 byte
LDI r1, 0x80000000
CMP r7, r1
BGE r9, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r5, 0x3000
LOAD r13, r5       ; r13 = first byte
LDI r12, 0x47       ; 'G'
CMP r13, r12
JZ r9, success
JMP fail

success:
LDI r8, 96
LDI r4, 96
LDI r2, 64
LDI r6, 64
LDI r15, 0x00FF00
RECTF r8, r4, r2, r6, r15
HALT

fail:
LDI r8, 96
LDI r4, 96
LDI r2, 64
LDI r6, 64
LDI r15, 0xFF0000
RECTF r8, r4, r2, r6, r15
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

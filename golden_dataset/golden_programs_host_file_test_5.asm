; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r14, filepath
LDI r15, 0           ; read mode
FSOPEN r14, r15

; r2 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r2 < 0x80000000 means success (handle is small)
LDI r5, 0x80000000
CMP r2, r5
BGE r2, fail        ; if handle >= 0x80000000, it's an error
MOV r9, r2         ; save handle

; FSREAD handle, buf, len
LDI r15, 0x3000      ; buffer
LDI r1, 4           ; read 4 bytes
MOV r14, r9
FSREAD r14, r15, r1
MOV r0, r2         ; bytes read

; FSCLOSE handle
MOV r14, r9
FSCLOSE r14

; Check if we read at least 1 byte
LDI r5, 0x80000000
CMP r0, r5
BGE r2, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r4, 0x3000
LOAD r6, r4       ; r6 = first byte
LDI r7, 0x47       ; 'G'
CMP r6, r7
JZ r2, success
JMP fail

success:
LDI r14, 96
LDI r15, 96
LDI r1, 64
LDI r10, 64
LDI r8, 0x00FF00
RECTF r14, r15, r1, r10, r8
HALT

fail:
LDI r14, 96
LDI r15, 96
LDI r1, 64
LDI r10, 64
LDI r8, 0xFF0000
RECTF r14, r15, r1, r10, r8
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

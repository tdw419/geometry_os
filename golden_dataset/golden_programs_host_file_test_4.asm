; DESCRIPTION: Display a rectangle using color red at the screen.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r7, filepath
LDI r11, 0           ; read mode
FSOPEN r7, r11

; r9 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r9 < 0x80000000 means success (handle is small)
LDI r0, 0x80000000
CMP r9, r0
BGE r9, fail        ; if handle >= 0x80000000, it's an error
MOV r2, r9         ; save handle

; FSREAD handle, buf, len
LDI r11, 0x3000      ; buffer
LDI r5, 4           ; read 4 bytes
MOV r7, r2
FSREAD r7, r11, r5
MOV r13, r9         ; bytes read

; FSCLOSE handle
MOV r7, r2
FSCLOSE r7

; Check if we read at least 1 byte
LDI r0, 0x80000000
CMP r13, r0
BGE r9, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r14, 0x3000
LOAD r12, r14       ; r12 = first byte
LDI r6, 0x47       ; 'G'
CMP r12, r6
JZ r9, success
JMP fail

success:
LDI r7, 96
LDI r11, 96
LDI r5, 64
LDI r10, 64
LDI r8, 0x00FF00
RECTF r7, r11, r5, r10, r8
HALT

fail:
LDI r7, 96
LDI r11, 96
LDI r5, 64
LDI r10, 64
LDI r8, 0xFF0000
RECTF r7, r11, r5, r10, r8
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

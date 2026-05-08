; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r12, filepath
LDI r15, 0           ; read mode
FSOPEN r12, r15

; r9 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r9 < 0x80000000 means success (handle is small)
LDI r6, 0x80000000
CMP r9, r6
BGE r9, fail        ; if handle >= 0x80000000, it's an error
MOV r14, r9         ; save handle

; FSREAD handle, buf, len
LDI r15, 0x3000      ; buffer
LDI r8, 4           ; read 4 bytes
MOV r12, r14
FSREAD r12, r15, r8
MOV r11, r9         ; bytes read

; FSCLOSE handle
MOV r12, r14
FSCLOSE r12

; Check if we read at least 1 byte
LDI r6, 0x80000000
CMP r11, r6
BGE r9, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r10, 0x3000
LOAD r0, r10       ; r0 = first byte
LDI r7, 0x47       ; 'G'
CMP r0, r7
JZ r9, success
JMP fail

success:
LDI r12, 96
LDI r15, 96
LDI r8, 64
LDI r3, 64
LDI r4, 0x00FF00
RECTF r12, r15, r8, r3, r4
HALT

fail:
LDI r12, 96
LDI r15, 96
LDI r8, 64
LDI r3, 64
LDI r4, 0xFF0000
RECTF r12, r15, r8, r3, r4
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

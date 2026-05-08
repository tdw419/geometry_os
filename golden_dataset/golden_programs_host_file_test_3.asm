; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; Phase 137: Host Filesystem Read Demo
; Reads the first 4 bytes of a test file and draws green if "GEOS" found.
;
; Setup: Create ~/.geos_host_file_test.txt with content "GEOS"
; This program opens it for reading, reads 4 bytes, and checks for 'G' (0x47)

; FSOPEN path_reg, mode_reg  -- open for reading
LDI r9, filepath
LDI r6, 0           ; read mode
FSOPEN r9, r6

; r11 has handle. Error codes are >= 0xFFFFFF00.
; Simple check: r11 < 0x80000000 means success (handle is small)
LDI r8, 0x80000000
CMP r11, r8
BGE r11, fail        ; if handle >= 0x80000000, it's an error
MOV r10, r11         ; save handle

; FSREAD handle, buf, len
LDI r6, 0x3000      ; buffer
LDI r5, 4           ; read 4 bytes
MOV r9, r10
FSREAD r9, r6, r5
MOV r13, r11         ; bytes read

; FSCLOSE handle
MOV r9, r10
FSCLOSE r9

; Check if we read at least 1 byte
LDI r8, 0x80000000
CMP r13, r8
BGE r11, fail        ; bytes_read >= 0x80000000 means error

; Check first byte is 'G' (0x47)
LDI r1, 0x3000
LOAD r3, r1       ; r3 = first byte
LDI r0, 0x47       ; 'G'
CMP r3, r0
JZ r11, success
JMP fail

success:
LDI r9, 96
LDI r6, 96
LDI r5, 64
LDI r7, 64
LDI r15, 0x00FF00
RECTF r9, r6, r5, r7, r15
HALT

fail:
LDI r9, 96
LDI r6, 96
LDI r5, 64
LDI r7, 64
LDI r15, 0xFF0000
RECTF r9, r6, r5, r7, r15
HALT

filepath:
.asciz "~/.geos_host_file_test.txt"

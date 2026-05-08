; DESCRIPTION: Geometry OS program to draw a red rectangle.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r13, dirpath
LDI r15, 0x3000      ; buffer for filenames
LDI r11, 1024        ; max bytes
FSLS r13, r15, r11
MOV r9, r7         ; save total bytes written

LDI r5, 0
CMP r9, r5
JZ r7, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r13, 0
LDI r15, 0
LDI r11, 256
LDI r1, 8
LDI r6, 0x4444FF
RECTF r13, r15, r11, r1, r6

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r13, 0
LDI r15, 12
LDI r11, 128
LDI r1, 4
LDI r6, 0x00FF00
RECTF r13, r15, r11, r1, r6

; White bar showing data content (sample from buffer)
LDI r13, 0
LDI r15, 20
LDI r11, 128
LDI r1, 2
LDI r6, 0xFFFFFF
RECTF r13, r15, r11, r1, r6

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r13, 0
LDI r15, 0
LDI r11, 256
LDI r1, 8
LDI r6, 0xFF0000
RECTF r13, r15, r11, r1, r6
HALT

dirpath:
.asciz "~"

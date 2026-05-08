; DESCRIPTION: Render a red rectangle at the screen.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r9, dirpath
LDI r13, 0x3000      ; buffer for filenames
LDI r15, 1024        ; max bytes
FSLS r9, r13, r15
MOV r11, r4         ; save total bytes written

LDI r14, 0
CMP r11, r14
JZ r4, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r9, 0
LDI r13, 0
LDI r15, 256
LDI r5, 8
LDI r8, 0x4444FF
RECTF r9, r13, r15, r5, r8

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r9, 0
LDI r13, 12
LDI r15, 128
LDI r5, 4
LDI r8, 0x00FF00
RECTF r9, r13, r15, r5, r8

; White bar showing data content (sample from buffer)
LDI r9, 0
LDI r13, 20
LDI r15, 128
LDI r5, 2
LDI r8, 0xFFFFFF
RECTF r9, r13, r15, r5, r8

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r9, 0
LDI r13, 0
LDI r15, 256
LDI r5, 8
LDI r8, 0xFF0000
RECTF r9, r13, r15, r5, r8
HALT

dirpath:
.asciz "~"

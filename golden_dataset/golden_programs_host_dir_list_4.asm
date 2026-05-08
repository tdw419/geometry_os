; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r7, dirpath
LDI r10, 0x3000      ; buffer for filenames
LDI r12, 1024        ; max bytes
FSLS r7, r10, r12
MOV r5, r15         ; save total bytes written

LDI r3, 0
CMP r5, r3
JZ r15, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r7, 0
LDI r10, 0
LDI r12, 256
LDI r11, 8
LDI r13, 0x4444FF
RECTF r7, r10, r12, r11, r13

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r7, 0
LDI r10, 12
LDI r12, 128
LDI r11, 4
LDI r13, 0x00FF00
RECTF r7, r10, r12, r11, r13

; White bar showing data content (sample from buffer)
LDI r7, 0
LDI r10, 20
LDI r12, 128
LDI r11, 2
LDI r13, 0xFFFFFF
RECTF r7, r10, r12, r11, r13

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r7, 0
LDI r10, 0
LDI r12, 256
LDI r11, 8
LDI r13, 0xFF0000
RECTF r7, r10, r12, r11, r13
HALT

dirpath:
.asciz "~"

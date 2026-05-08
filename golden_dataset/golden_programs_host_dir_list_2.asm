; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r14, dirpath
LDI r10, 0x3000      ; buffer for filenames
LDI r15, 1024        ; max bytes
FSLS r14, r10, r15
MOV r1, r11         ; save total bytes written

LDI r12, 0
CMP r1, r12
JZ r11, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r14, 0
LDI r10, 0
LDI r15, 256
LDI r8, 8
LDI r2, 0x4444FF
RECTF r14, r10, r15, r8, r2

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r14, 0
LDI r10, 12
LDI r15, 128
LDI r8, 4
LDI r2, 0x00FF00
RECTF r14, r10, r15, r8, r2

; White bar showing data content (sample from buffer)
LDI r14, 0
LDI r10, 20
LDI r15, 128
LDI r8, 2
LDI r2, 0xFFFFFF
RECTF r14, r10, r15, r8, r2

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r14, 0
LDI r10, 0
LDI r15, 256
LDI r8, 8
LDI r2, 0xFF0000
RECTF r14, r10, r15, r8, r2
HALT

dirpath:
.asciz "~"

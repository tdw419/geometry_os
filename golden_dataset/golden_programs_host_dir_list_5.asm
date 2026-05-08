; DESCRIPTION: Display a rectangle using color red at the screen.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r13, dirpath
LDI r10, 0x3000      ; buffer for filenames
LDI r0, 1024        ; max bytes
FSLS r13, r10, r0
MOV r8, r4         ; save total bytes written

LDI r11, 0
CMP r8, r11
JZ r4, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r13, 0
LDI r10, 0
LDI r0, 256
LDI r14, 8
LDI r1, 0x4444FF
RECTF r13, r10, r0, r14, r1

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r13, 0
LDI r10, 12
LDI r0, 128
LDI r14, 4
LDI r1, 0x00FF00
RECTF r13, r10, r0, r14, r1

; White bar showing data content (sample from buffer)
LDI r13, 0
LDI r10, 20
LDI r0, 128
LDI r14, 2
LDI r1, 0xFFFFFF
RECTF r13, r10, r0, r14, r1

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r13, 0
LDI r10, 0
LDI r0, 256
LDI r14, 8
LDI r1, 0xFF0000
RECTF r13, r10, r0, r14, r1
HALT

dirpath:
.asciz "~"

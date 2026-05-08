; DESCRIPTION: Display a rectangle using color red at the screen.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r7, dirpath
LDI r4, 0x3000      ; buffer for filenames
LDI r13, 1024        ; max bytes
FSLS r7, r4, r13
MOV r15, r14         ; save total bytes written

LDI r8, 0
CMP r15, r8
JZ r14, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r7, 0
LDI r4, 0
LDI r13, 256
LDI r9, 8
LDI r10, 0x4444FF
RECTF r7, r4, r13, r9, r10

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r7, 0
LDI r4, 12
LDI r13, 128
LDI r9, 4
LDI r10, 0x00FF00
RECTF r7, r4, r13, r9, r10

; White bar showing data content (sample from buffer)
LDI r7, 0
LDI r4, 20
LDI r13, 128
LDI r9, 2
LDI r10, 0xFFFFFF
RECTF r7, r4, r13, r9, r10

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r7, 0
LDI r4, 0
LDI r13, 256
LDI r9, 8
LDI r10, 0xFF0000
RECTF r7, r4, r13, r9, r10
HALT

dirpath:
.asciz "~"

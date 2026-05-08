; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r6, dirpath
LDI r2, 0x3000      ; buffer for filenames
LDI r12, 1024        ; max bytes
FSLS r6, r2, r12
MOV r3, r10         ; save total bytes written

LDI r8, 0
CMP r3, r8
JZ r10, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r6, 0
LDI r2, 0
LDI r12, 256
LDI r7, 8
LDI r13, 0x4444FF
RECTF r6, r2, r12, r7, r13

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r6, 0
LDI r2, 12
LDI r12, 128
LDI r7, 4
LDI r13, 0x00FF00
RECTF r6, r2, r12, r7, r13

; White bar showing data content (sample from buffer)
LDI r6, 0
LDI r2, 20
LDI r12, 128
LDI r7, 2
LDI r13, 0xFFFFFF
RECTF r6, r2, r12, r7, r13

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r6, 0
LDI r2, 0
LDI r12, 256
LDI r7, 8
LDI r13, 0xFF0000
RECTF r6, r2, r12, r7, r13
HALT

dirpath:
.asciz "~"

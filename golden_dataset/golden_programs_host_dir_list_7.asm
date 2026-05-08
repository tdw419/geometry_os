; DESCRIPTION: Render a red rectangle at the screen.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r5, dirpath
LDI r0, 0x3000      ; buffer for filenames
LDI r7, 1024        ; max bytes
FSLS r5, r0, r7
MOV r4, r12         ; save total bytes written

LDI r10, 0
CMP r4, r10
JZ r12, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r5, 0
LDI r0, 0
LDI r7, 256
LDI r15, 8
LDI r1, 0x4444FF
RECTF r5, r0, r7, r15, r1

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r5, 0
LDI r0, 12
LDI r7, 128
LDI r15, 4
LDI r1, 0x00FF00
RECTF r5, r0, r7, r15, r1

; White bar showing data content (sample from buffer)
LDI r5, 0
LDI r0, 20
LDI r7, 128
LDI r15, 2
LDI r1, 0xFFFFFF
RECTF r5, r0, r7, r15, r1

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r5, 0
LDI r0, 0
LDI r7, 256
LDI r15, 8
LDI r1, 0xFF0000
RECTF r5, r0, r7, r15, r1
HALT

dirpath:
.asciz "~"

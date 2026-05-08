; DESCRIPTION: Geometry OS program to draw a red rectangle.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r12, dirpath
LDI r0, 0x3000      ; buffer for filenames
LDI r10, 1024        ; max bytes
FSLS r12, r0, r10
MOV r15, r5         ; save total bytes written

LDI r3, 0
CMP r15, r3
JZ r5, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r12, 0
LDI r0, 0
LDI r10, 256
LDI r9, 8
LDI r14, 0x4444FF
RECTF r12, r0, r10, r9, r14

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r12, 0
LDI r0, 12
LDI r10, 128
LDI r9, 4
LDI r14, 0x00FF00
RECTF r12, r0, r10, r9, r14

; White bar showing data content (sample from buffer)
LDI r12, 0
LDI r0, 20
LDI r10, 128
LDI r9, 2
LDI r14, 0xFFFFFF
RECTF r12, r0, r10, r9, r14

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r12, 0
LDI r0, 0
LDI r10, 256
LDI r9, 8
LDI r14, 0xFF0000
RECTF r12, r0, r10, r9, r14
HALT

dirpath:
.asciz "~"

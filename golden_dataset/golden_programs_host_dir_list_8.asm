; DESCRIPTION: This GeOS assembly code demonstrates listing the home directory using the FSLS function and visually indicates success or failure with colored bars. On successful execution, it displays a blue bar at the top, followed by a green bar representing the number of bytes listed, capped at 128 pixels wide. Additionally, a white bar shows sample data content from the buffer. If there is an error (e.g., no entries or FSLS failure), it displays a red bar instead.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r12, dirpath
LDI r1, 0x3000      ; buffer for filenames
LDI r10, 1024        ; max bytes
FSLS r12, r1, r10
MOV r13, r11         ; save total bytes written

LDI r3, 0
CMP r13, r3
JZ r11, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r12, 0
LDI r1, 0
LDI r10, 256
LDI r15, 8
LDI r0, 0x4444FF
RECTF r12, r1, r10, r15, r0

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r12, 0
LDI r1, 12
LDI r10, 128
LDI r15, 4
LDI r0, 0x00FF00
RECTF r12, r1, r10, r15, r0

; White bar showing data content (sample from buffer)
LDI r12, 0
LDI r1, 20
LDI r10, 128
LDI r15, 2
LDI r0, 0xFFFFFF
RECTF r12, r1, r10, r15, r0

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r12, 0
LDI r1, 0
LDI r10, 256
LDI r15, 8
LDI r0, 0xFF0000
RECTF r12, r1, r10, r15, r0
HALT

dirpath:
.asciz "~"

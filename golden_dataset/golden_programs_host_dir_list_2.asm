; DESCRIPTION: This GeOS assembly code demonstrates listing the home directory using the FSLS function and visually indicates success or failure with colored bars. On successful execution, it displays a blue bar at the top, followed by a green bar representing the number of bytes listed, capped at 128 pixels wide. Additionally, a white bar shows sample data content from the buffer. If there is an error (e.g., no entries or FSLS failure), it displays a red bar instead.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r13, dirpath
LDI r5, 0x3000      ; buffer for filenames
LDI r1, 1024        ; max bytes
FSLS r13, r5, r1
MOV r11, r6         ; save total bytes written

LDI r2, 0
CMP r11, r2
JZ r6, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r13, 0
LDI r5, 0
LDI r1, 256
LDI r12, 8
LDI r4, 0x4444FF
RECTF r13, r5, r1, r12, r4

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r13, 0
LDI r5, 12
LDI r1, 128
LDI r12, 4
LDI r4, 0x00FF00
RECTF r13, r5, r1, r12, r4

; White bar showing data content (sample from buffer)
LDI r13, 0
LDI r5, 20
LDI r1, 128
LDI r12, 2
LDI r4, 0xFFFFFF
RECTF r13, r5, r1, r12, r4

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r13, 0
LDI r5, 0
LDI r1, 256
LDI r12, 8
LDI r4, 0xFF0000
RECTF r13, r5, r1, r12, r4
HALT

dirpath:
.asciz "~"

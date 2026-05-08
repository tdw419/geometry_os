; DESCRIPTION: This GeOS assembly code demonstrates listing the home directory using the FSLS function and visually indicates success or failure with colored bars. On successful execution, it displays a blue bar at the top, followed by a green bar representing the number of bytes listed, capped at 128 pixels wide. Additionally, a white bar shows sample data content from the buffer. If there is an error (e.g., no entries or FSLS failure), it displays a red bar instead.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r4, dirpath
LDI r11, 0x3000      ; buffer for filenames
LDI r3, 1024        ; max bytes
FSLS r4, r11, r3
MOV r1, r2         ; save total bytes written

LDI r13, 0
CMP r1, r13
JZ r2, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r4, 0
LDI r11, 0
LDI r3, 256
LDI r7, 8
LDI r12, 0x4444FF
RECTF r4, r11, r3, r7, r12

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r4, 0
LDI r11, 12
LDI r3, 128
LDI r7, 4
LDI r12, 0x00FF00
RECTF r4, r11, r3, r7, r12

; White bar showing data content (sample from buffer)
LDI r4, 0
LDI r11, 20
LDI r3, 128
LDI r7, 2
LDI r12, 0xFFFFFF
RECTF r4, r11, r3, r7, r12

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r4, 0
LDI r11, 0
LDI r3, 256
LDI r7, 8
LDI r12, 0xFF0000
RECTF r4, r11, r3, r7, r12
HALT

dirpath:
.asciz "~"

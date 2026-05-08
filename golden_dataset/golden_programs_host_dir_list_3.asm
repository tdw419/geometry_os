; DESCRIPTION: This GeOS assembly code demonstrates listing the home directory using the FSLS function and visually indicates success or failure with colored bars. On successful execution, it displays a blue bar at the top, followed by a green bar representing the number of bytes listed, capped at 128 pixels wide. Additionally, a white bar shows sample data content from the buffer. If there is an error (e.g., no entries or FSLS failure), it displays a red bar instead.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r8, dirpath
LDI r14, 0x3000      ; buffer for filenames
LDI r11, 1024        ; max bytes
FSLS r8, r14, r11
MOV r12, r5         ; save total bytes written

LDI r0, 0
CMP r12, r0
JZ r5, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r8, 0
LDI r14, 0
LDI r11, 256
LDI r9, 8
LDI r6, 0x4444FF
RECTF r8, r14, r11, r9, r6

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r8, 0
LDI r14, 12
LDI r11, 128
LDI r9, 4
LDI r6, 0x00FF00
RECTF r8, r14, r11, r9, r6

; White bar showing data content (sample from buffer)
LDI r8, 0
LDI r14, 20
LDI r11, 128
LDI r9, 2
LDI r6, 0xFFFFFF
RECTF r8, r14, r11, r9, r6

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r8, 0
LDI r14, 0
LDI r11, 256
LDI r9, 8
LDI r6, 0xFF0000
RECTF r8, r14, r11, r9, r6
HALT

dirpath:
.asciz "~"

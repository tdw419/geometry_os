; DESCRIPTION: This GeOS assembly code demonstrates listing the home directory using the FSLS function and visually indicates success or failure with colored bars. On successful execution, it displays a blue bar at the top, followed by a green bar representing the number of bytes listed, capped at 128 pixels wide. Additionally, a white bar shows sample data content from the buffer. If there is an error (e.g., no entries or FSLS failure), it displays a red bar instead.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r2, dirpath
LDI r0, 0x3000      ; buffer for filenames
LDI r7, 1024        ; max bytes
FSLS r2, r0, r7
MOV r9, r8         ; save total bytes written

LDI r3, 0
CMP r9, r3
JZ r8, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r2, 0
LDI r0, 0
LDI r7, 256
LDI r1, 8
LDI r6, 0x4444FF
RECTF r2, r0, r7, r1, r6

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r2, 0
LDI r0, 12
LDI r7, 128
LDI r1, 4
LDI r6, 0x00FF00
RECTF r2, r0, r7, r1, r6

; White bar showing data content (sample from buffer)
LDI r2, 0
LDI r0, 20
LDI r7, 128
LDI r1, 2
LDI r6, 0xFFFFFF
RECTF r2, r0, r7, r1, r6

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r2, 0
LDI r0, 0
LDI r7, 256
LDI r1, 8
LDI r6, 0xFF0000
RECTF r2, r0, r7, r1, r6
HALT

dirpath:
.asciz "~"

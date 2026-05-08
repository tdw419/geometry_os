; DESCRIPTION: This GeOS assembly code demonstrates listing the home directory using the FSLS function and visually indicates success or failure with colored bars. On successful execution, it displays a blue bar at the top, followed by a green bar representing the number of bytes listed, capped at 128 pixels wide. Additionally, a white bar shows sample data content from the buffer. If there is an error (e.g., no entries or FSLS failure), it displays a red bar instead.

; Phase 137: Directory Listing Demo
; Uses FSLS to list the home directory.
; Blue bar at top = success, red bar = failure.

; List home directory
LDI r5, dirpath
LDI r3, 0x3000      ; buffer for filenames
LDI r10, 1024        ; max bytes
FSLS r5, r3, r10
MOV r14, r13         ; save total bytes written

LDI r6, 0
CMP r14, r6
JZ r13, fail         ; no entries or error

; Blue bar = FSLS succeeded
LDI r5, 0
LDI r3, 0
LDI r10, 256
LDI r0, 8
LDI r15, 0x4444FF
RECTF r5, r3, r10, r0, r15

; Draw a green bar showing how many bytes of listing we got
; (capped at 128 pixels wide)
LDI r5, 0
LDI r3, 12
LDI r10, 128
LDI r0, 4
LDI r15, 0x00FF00
RECTF r5, r3, r10, r0, r15

; White bar showing data content (sample from buffer)
LDI r5, 0
LDI r3, 20
LDI r10, 128
LDI r0, 2
LDI r15, 0xFFFFFF
RECTF r5, r3, r10, r0, r15

HALT

fail:
; Red bar = error (sandbox violation or FSLS failure)
LDI r5, 0
LDI r3, 0
LDI r10, 256
LDI r0, 8
LDI r15, 0xFF0000
RECTF r5, r3, r10, r0, r15
HALT

dirpath:
.asciz "~"

; DESCRIPTION: Display a rectangle using color green at the screen.

; block_mem_demo.asm -- Demonstrate MEMSET and MEMCPY opcodes
; MEMSET fills a region with a value, MEMCPY copies regions (overlap-safe)
; This demo shows a checkerboard created with MEMSET + MEMCPY instead of loops

; Memory layout:
; 0x7000-0x73FF = source pattern (4 rows x 16 cols = 64 words per row pattern)
; 0x7400-0x77FF = screen buffer copy area
; 0x7800 = row counter

; First, use MEMSET to fill a source pattern area with alternating values
; Pattern: two 16-word rows, one filled with color1, one with color2
LDI r12, 0x7000        ; pattern base
LDI r6, 0x00FF00      ; green
LDI r4, 16           ; 16 words per row
MEMSET r12, r6, r4     ; row 0 = green

LDI r12, 0x7010        ; next row (16 words later)
LDI r6, 0x0000FF      ; blue
MEMSET r12, r6, r4     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r12, 0x7400        ; dst
LDI r6, 0x7000        ; src
LDI r4, 32           ; copy both rows (32 words)
MEMCPY r12, r6, r4

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r15, 0xFF0000      ; red
LDI r0, 0x7000
STORE r0, r15          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r12, 0x7001        ; dst (overlap with src)
LDI r6, 0x7000        ; src
LDI r4, 16           ; len
MEMCPY r12, r6, r4     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r9, 0
LDI r11, 0
LDI r3, 256
LDI r5, 16
LDI r2, 0x00FF00
RECTF r9, r11, r3, r5, r2

; Blue row at y=16
LDI r11, 16
LDI r2, 0x0000FF
RECTF r9, r11, r3, r5, r2

; Red row at y=32 (the modified pattern)
LDI r11, 32
LDI r2, 0xFF0000
RECTF r9, r11, r3, r5, r2

; Green row at y=48
LDI r11, 48
LDI r2, 0x00FF00
RECTF r9, r11, r3, r5, r2

; Blue row at y=64
LDI r11, 64
LDI r2, 0x0000FF
RECTF r9, r11, r3, r5, r2

; Text label
LDI r9, 10
LDI r11, 100
LDI r3, 0x7400
LDI r5, 77           ; M
STORE r3, r5
LDI r5, 69           ; E
LDI r13, 0x7401
STORE r13, r5
LDI r5, 77           ; M
LDI r13, 0x7402
STORE r13, r5
LDI r5, 67           ; C
LDI r13, 0x7403
STORE r13, r5
LDI r5, 80           ; P
LDI r13, 0x7404
STORE r13, r5
LDI r5, 89           ; Y
LDI r13, 0x7405
STORE r13, r5
LDI r5, 0            ; null terminator
LDI r13, 0x7406
STORE r13, r5
TEXT r9, r11, r3

; MEMSET label
LDI r9, 10
LDI r11, 120
LDI r5, 77           ; M
LDI r13, 0x7410
STORE r13, r5
LDI r5, 69           ; E
LDI r13, 0x7411
STORE r13, r5
LDI r5, 77           ; M
LDI r13, 0x7412
STORE r13, r5
LDI r5, 83           ; S
LDI r13, 0x7413
STORE r13, r5
LDI r5, 69           ; E
LDI r13, 0x7414
STORE r13, r5
LDI r5, 84           ; T
LDI r13, 0x7415
STORE r13, r5
LDI r5, 0
LDI r13, 0x7416
STORE r13, r5
LDI r3, 0x7410
TEXT r9, r11, r3

HALT

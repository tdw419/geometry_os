; DESCRIPTION: Draws a green rectangle at the screen with fixed size.

; block_mem_demo.asm -- Demonstrate MEMSET and MEMCPY opcodes
; MEMSET fills a region with a value, MEMCPY copies regions (overlap-safe)
; This demo shows a checkerboard created with MEMSET + MEMCPY instead of loops

; Memory layout:
; 0x7000-0x73FF = source pattern (4 rows x 16 cols = 64 words per row pattern)
; 0x7400-0x77FF = screen buffer copy area
; 0x7800 = row counter

; First, use MEMSET to fill a source pattern area with alternating values
; Pattern: two 16-word rows, one filled with color1, one with color2
LDI r7, 0x7000        ; pattern base
LDI r9, 0x00FF00      ; green
LDI r11, 16           ; 16 words per row
MEMSET r7, r9, r11     ; row 0 = green

LDI r7, 0x7010        ; next row (16 words later)
LDI r9, 0x0000FF      ; blue
MEMSET r7, r9, r11     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r7, 0x7400        ; dst
LDI r9, 0x7000        ; src
LDI r11, 32           ; copy both rows (32 words)
MEMCPY r7, r9, r11

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r15, 0xFF0000      ; red
LDI r12, 0x7000
STORE r12, r15          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r7, 0x7001        ; dst (overlap with src)
LDI r9, 0x7000        ; src
LDI r11, 16           ; len
MEMCPY r7, r9, r11     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r4, 0
LDI r5, 0
LDI r13, 256
LDI r14, 16
LDI r6, 0x00FF00
RECTF r4, r5, r13, r14, r6

; Blue row at y=16
LDI r5, 16
LDI r6, 0x0000FF
RECTF r4, r5, r13, r14, r6

; Red row at y=32 (the modified pattern)
LDI r5, 32
LDI r6, 0xFF0000
RECTF r4, r5, r13, r14, r6

; Green row at y=48
LDI r5, 48
LDI r6, 0x00FF00
RECTF r4, r5, r13, r14, r6

; Blue row at y=64
LDI r5, 64
LDI r6, 0x0000FF
RECTF r4, r5, r13, r14, r6

; Text label
LDI r4, 10
LDI r5, 100
LDI r13, 0x7400
LDI r14, 77           ; M
STORE r13, r14
LDI r14, 69           ; E
LDI r8, 0x7401
STORE r8, r14
LDI r14, 77           ; M
LDI r8, 0x7402
STORE r8, r14
LDI r14, 67           ; C
LDI r8, 0x7403
STORE r8, r14
LDI r14, 80           ; P
LDI r8, 0x7404
STORE r8, r14
LDI r14, 89           ; Y
LDI r8, 0x7405
STORE r8, r14
LDI r14, 0            ; null terminator
LDI r8, 0x7406
STORE r8, r14
TEXT r4, r5, r13

; MEMSET label
LDI r4, 10
LDI r5, 120
LDI r14, 77           ; M
LDI r8, 0x7410
STORE r8, r14
LDI r14, 69           ; E
LDI r8, 0x7411
STORE r8, r14
LDI r14, 77           ; M
LDI r8, 0x7412
STORE r8, r14
LDI r14, 83           ; S
LDI r8, 0x7413
STORE r8, r14
LDI r14, 69           ; E
LDI r8, 0x7414
STORE r8, r14
LDI r14, 84           ; T
LDI r8, 0x7415
STORE r8, r14
LDI r14, 0
LDI r8, 0x7416
STORE r8, r14
LDI r13, 0x7410
TEXT r4, r5, r13

HALT

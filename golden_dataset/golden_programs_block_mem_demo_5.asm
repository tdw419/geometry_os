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
LDI r14, 0x7000        ; pattern base
LDI r13, 0x00FF00      ; green
LDI r11, 16           ; 16 words per row
MEMSET r14, r13, r11     ; row 0 = green

LDI r14, 0x7010        ; next row (16 words later)
LDI r13, 0x0000FF      ; blue
MEMSET r14, r13, r11     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r14, 0x7400        ; dst
LDI r13, 0x7000        ; src
LDI r11, 32           ; copy both rows (32 words)
MEMCPY r14, r13, r11

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r1, 0xFF0000      ; red
LDI r5, 0x7000
STORE r5, r1          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r14, 0x7001        ; dst (overlap with src)
LDI r13, 0x7000        ; src
LDI r11, 16           ; len
MEMCPY r14, r13, r11     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r7, 0
LDI r2, 0
LDI r4, 256
LDI r8, 16
LDI r10, 0x00FF00
RECTF r7, r2, r4, r8, r10

; Blue row at y=16
LDI r2, 16
LDI r10, 0x0000FF
RECTF r7, r2, r4, r8, r10

; Red row at y=32 (the modified pattern)
LDI r2, 32
LDI r10, 0xFF0000
RECTF r7, r2, r4, r8, r10

; Green row at y=48
LDI r2, 48
LDI r10, 0x00FF00
RECTF r7, r2, r4, r8, r10

; Blue row at y=64
LDI r2, 64
LDI r10, 0x0000FF
RECTF r7, r2, r4, r8, r10

; Text label
LDI r7, 10
LDI r2, 100
LDI r4, 0x7400
LDI r8, 77           ; M
STORE r4, r8
LDI r8, 69           ; E
LDI r6, 0x7401
STORE r6, r8
LDI r8, 77           ; M
LDI r6, 0x7402
STORE r6, r8
LDI r8, 67           ; C
LDI r6, 0x7403
STORE r6, r8
LDI r8, 80           ; P
LDI r6, 0x7404
STORE r6, r8
LDI r8, 89           ; Y
LDI r6, 0x7405
STORE r6, r8
LDI r8, 0            ; null terminator
LDI r6, 0x7406
STORE r6, r8
TEXT r7, r2, r4

; MEMSET label
LDI r7, 10
LDI r2, 120
LDI r8, 77           ; M
LDI r6, 0x7410
STORE r6, r8
LDI r8, 69           ; E
LDI r6, 0x7411
STORE r6, r8
LDI r8, 77           ; M
LDI r6, 0x7412
STORE r6, r8
LDI r8, 83           ; S
LDI r6, 0x7413
STORE r6, r8
LDI r8, 69           ; E
LDI r6, 0x7414
STORE r6, r8
LDI r8, 84           ; T
LDI r6, 0x7415
STORE r6, r8
LDI r8, 0
LDI r6, 0x7416
STORE r6, r8
LDI r4, 0x7410
TEXT r7, r2, r4

HALT

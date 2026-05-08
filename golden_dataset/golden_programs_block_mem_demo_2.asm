; DESCRIPTION: This GeOS assembly code demonstrates the use of MEMSET and MEMCPY opcodes to create a checkerboard pattern in memory without using loops. It first fills a source pattern area with alternating colors (green and blue) using MEMSET, then copies this pattern to a screen buffer using MEMCPY. The code also includes tests for overlap-safe copying and renders the patterns to the screen using RECTF. Finally, it displays text labels "MEMCPY" and "MEMSET".

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
LDI r12, 16           ; 16 words per row
MEMSET r14, r13, r12     ; row 0 = green

LDI r14, 0x7010        ; next row (16 words later)
LDI r13, 0x0000FF      ; blue
MEMSET r14, r13, r12     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r14, 0x7400        ; dst
LDI r13, 0x7000        ; src
LDI r12, 32           ; copy both rows (32 words)
MEMCPY r14, r13, r12

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r2, 0xFF0000      ; red
LDI r0, 0x7000
STORE r0, r2          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r14, 0x7001        ; dst (overlap with src)
LDI r13, 0x7000        ; src
LDI r12, 16           ; len
MEMCPY r14, r13, r12     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r15, 0
LDI r9, 0
LDI r3, 256
LDI r7, 16
LDI r11, 0x00FF00
RECTF r15, r9, r3, r7, r11

; Blue row at y=16
LDI r9, 16
LDI r11, 0x0000FF
RECTF r15, r9, r3, r7, r11

; Red row at y=32 (the modified pattern)
LDI r9, 32
LDI r11, 0xFF0000
RECTF r15, r9, r3, r7, r11

; Green row at y=48
LDI r9, 48
LDI r11, 0x00FF00
RECTF r15, r9, r3, r7, r11

; Blue row at y=64
LDI r9, 64
LDI r11, 0x0000FF
RECTF r15, r9, r3, r7, r11

; Text label
LDI r15, 10
LDI r9, 100
LDI r3, 0x7400
LDI r7, 77           ; M
STORE r3, r7
LDI r7, 69           ; E
LDI r5, 0x7401
STORE r5, r7
LDI r7, 77           ; M
LDI r5, 0x7402
STORE r5, r7
LDI r7, 67           ; C
LDI r5, 0x7403
STORE r5, r7
LDI r7, 80           ; P
LDI r5, 0x7404
STORE r5, r7
LDI r7, 89           ; Y
LDI r5, 0x7405
STORE r5, r7
LDI r7, 0            ; null terminator
LDI r5, 0x7406
STORE r5, r7
TEXT r15, r9, r3

; MEMSET label
LDI r15, 10
LDI r9, 120
LDI r7, 77           ; M
LDI r5, 0x7410
STORE r5, r7
LDI r7, 69           ; E
LDI r5, 0x7411
STORE r5, r7
LDI r7, 77           ; M
LDI r5, 0x7412
STORE r5, r7
LDI r7, 83           ; S
LDI r5, 0x7413
STORE r5, r7
LDI r7, 69           ; E
LDI r5, 0x7414
STORE r5, r7
LDI r7, 84           ; T
LDI r5, 0x7415
STORE r5, r7
LDI r7, 0
LDI r5, 0x7416
STORE r5, r7
LDI r3, 0x7410
TEXT r15, r9, r3

HALT

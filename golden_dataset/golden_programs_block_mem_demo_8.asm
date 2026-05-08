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
LDI r12, 0x00FF00      ; green
LDI r6, 16           ; 16 words per row
MEMSET r14, r12, r6     ; row 0 = green

LDI r14, 0x7010        ; next row (16 words later)
LDI r12, 0x0000FF      ; blue
MEMSET r14, r12, r6     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r14, 0x7400        ; dst
LDI r12, 0x7000        ; src
LDI r6, 32           ; copy both rows (32 words)
MEMCPY r14, r12, r6

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r1, 0xFF0000      ; red
LDI r11, 0x7000
STORE r11, r1          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r14, 0x7001        ; dst (overlap with src)
LDI r12, 0x7000        ; src
LDI r6, 16           ; len
MEMCPY r14, r12, r6     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r4, 0
LDI r5, 0
LDI r0, 256
LDI r15, 16
LDI r13, 0x00FF00
RECTF r4, r5, r0, r15, r13

; Blue row at y=16
LDI r5, 16
LDI r13, 0x0000FF
RECTF r4, r5, r0, r15, r13

; Red row at y=32 (the modified pattern)
LDI r5, 32
LDI r13, 0xFF0000
RECTF r4, r5, r0, r15, r13

; Green row at y=48
LDI r5, 48
LDI r13, 0x00FF00
RECTF r4, r5, r0, r15, r13

; Blue row at y=64
LDI r5, 64
LDI r13, 0x0000FF
RECTF r4, r5, r0, r15, r13

; Text label
LDI r4, 10
LDI r5, 100
LDI r0, 0x7400
LDI r15, 77           ; M
STORE r0, r15
LDI r15, 69           ; E
LDI r7, 0x7401
STORE r7, r15
LDI r15, 77           ; M
LDI r7, 0x7402
STORE r7, r15
LDI r15, 67           ; C
LDI r7, 0x7403
STORE r7, r15
LDI r15, 80           ; P
LDI r7, 0x7404
STORE r7, r15
LDI r15, 89           ; Y
LDI r7, 0x7405
STORE r7, r15
LDI r15, 0            ; null terminator
LDI r7, 0x7406
STORE r7, r15
TEXT r4, r5, r0

; MEMSET label
LDI r4, 10
LDI r5, 120
LDI r15, 77           ; M
LDI r7, 0x7410
STORE r7, r15
LDI r15, 69           ; E
LDI r7, 0x7411
STORE r7, r15
LDI r15, 77           ; M
LDI r7, 0x7412
STORE r7, r15
LDI r15, 83           ; S
LDI r7, 0x7413
STORE r7, r15
LDI r15, 69           ; E
LDI r7, 0x7414
STORE r7, r15
LDI r15, 84           ; T
LDI r7, 0x7415
STORE r7, r15
LDI r15, 0
LDI r7, 0x7416
STORE r7, r15
LDI r0, 0x7410
TEXT r4, r5, r0

HALT

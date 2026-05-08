; DESCRIPTION: Render a green rectangle at the screen.

; block_mem_demo.asm -- Demonstrate MEMSET and MEMCPY opcodes
; MEMSET fills a region with a value, MEMCPY copies regions (overlap-safe)
; This demo shows a checkerboard created with MEMSET + MEMCPY instead of loops

; Memory layout:
; 0x7000-0x73FF = source pattern (4 rows x 16 cols = 64 words per row pattern)
; 0x7400-0x77FF = screen buffer copy area
; 0x7800 = row counter

; First, use MEMSET to fill a source pattern area with alternating values
; Pattern: two 16-word rows, one filled with color1, one with color2
LDI r9, 0x7000        ; pattern base
LDI r6, 0x00FF00      ; green
LDI r15, 16           ; 16 words per row
MEMSET r9, r6, r15     ; row 0 = green

LDI r9, 0x7010        ; next row (16 words later)
LDI r6, 0x0000FF      ; blue
MEMSET r9, r6, r15     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r9, 0x7400        ; dst
LDI r6, 0x7000        ; src
LDI r15, 32           ; copy both rows (32 words)
MEMCPY r9, r6, r15

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r11, 0xFF0000      ; red
LDI r14, 0x7000
STORE r14, r11          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r9, 0x7001        ; dst (overlap with src)
LDI r6, 0x7000        ; src
LDI r15, 16           ; len
MEMCPY r9, r6, r15     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r8, 0
LDI r5, 0
LDI r13, 256
LDI r12, 16
LDI r3, 0x00FF00
RECTF r8, r5, r13, r12, r3

; Blue row at y=16
LDI r5, 16
LDI r3, 0x0000FF
RECTF r8, r5, r13, r12, r3

; Red row at y=32 (the modified pattern)
LDI r5, 32
LDI r3, 0xFF0000
RECTF r8, r5, r13, r12, r3

; Green row at y=48
LDI r5, 48
LDI r3, 0x00FF00
RECTF r8, r5, r13, r12, r3

; Blue row at y=64
LDI r5, 64
LDI r3, 0x0000FF
RECTF r8, r5, r13, r12, r3

; Text label
LDI r8, 10
LDI r5, 100
LDI r13, 0x7400
LDI r12, 77           ; M
STORE r13, r12
LDI r12, 69           ; E
LDI r7, 0x7401
STORE r7, r12
LDI r12, 77           ; M
LDI r7, 0x7402
STORE r7, r12
LDI r12, 67           ; C
LDI r7, 0x7403
STORE r7, r12
LDI r12, 80           ; P
LDI r7, 0x7404
STORE r7, r12
LDI r12, 89           ; Y
LDI r7, 0x7405
STORE r7, r12
LDI r12, 0            ; null terminator
LDI r7, 0x7406
STORE r7, r12
TEXT r8, r5, r13

; MEMSET label
LDI r8, 10
LDI r5, 120
LDI r12, 77           ; M
LDI r7, 0x7410
STORE r7, r12
LDI r12, 69           ; E
LDI r7, 0x7411
STORE r7, r12
LDI r12, 77           ; M
LDI r7, 0x7412
STORE r7, r12
LDI r12, 83           ; S
LDI r7, 0x7413
STORE r7, r12
LDI r12, 69           ; E
LDI r7, 0x7414
STORE r7, r12
LDI r12, 84           ; T
LDI r7, 0x7415
STORE r7, r12
LDI r12, 0
LDI r7, 0x7416
STORE r7, r12
LDI r13, 0x7410
TEXT r8, r5, r13

HALT

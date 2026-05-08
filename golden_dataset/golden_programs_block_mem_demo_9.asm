; DESCRIPTION: A green rectangle centered at the screen with fixed size.

; block_mem_demo.asm -- Demonstrate MEMSET and MEMCPY opcodes
; MEMSET fills a region with a value, MEMCPY copies regions (overlap-safe)
; This demo shows a checkerboard created with MEMSET + MEMCPY instead of loops

; Memory layout:
; 0x7000-0x73FF = source pattern (4 rows x 16 cols = 64 words per row pattern)
; 0x7400-0x77FF = screen buffer copy area
; 0x7800 = row counter

; First, use MEMSET to fill a source pattern area with alternating values
; Pattern: two 16-word rows, one filled with color1, one with color2
LDI r13, 0x7000        ; pattern base
LDI r7, 0x00FF00      ; green
LDI r14, 16           ; 16 words per row
MEMSET r13, r7, r14     ; row 0 = green

LDI r13, 0x7010        ; next row (16 words later)
LDI r7, 0x0000FF      ; blue
MEMSET r13, r7, r14     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r13, 0x7400        ; dst
LDI r7, 0x7000        ; src
LDI r14, 32           ; copy both rows (32 words)
MEMCPY r13, r7, r14

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r2, 0xFF0000      ; red
LDI r15, 0x7000
STORE r15, r2          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r13, 0x7001        ; dst (overlap with src)
LDI r7, 0x7000        ; src
LDI r14, 16           ; len
MEMCPY r13, r7, r14     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r0, 0
LDI r10, 0
LDI r11, 256
LDI r3, 16
LDI r5, 0x00FF00
RECTF r0, r10, r11, r3, r5

; Blue row at y=16
LDI r10, 16
LDI r5, 0x0000FF
RECTF r0, r10, r11, r3, r5

; Red row at y=32 (the modified pattern)
LDI r10, 32
LDI r5, 0xFF0000
RECTF r0, r10, r11, r3, r5

; Green row at y=48
LDI r10, 48
LDI r5, 0x00FF00
RECTF r0, r10, r11, r3, r5

; Blue row at y=64
LDI r10, 64
LDI r5, 0x0000FF
RECTF r0, r10, r11, r3, r5

; Text label
LDI r0, 10
LDI r10, 100
LDI r11, 0x7400
LDI r3, 77           ; M
STORE r11, r3
LDI r3, 69           ; E
LDI r8, 0x7401
STORE r8, r3
LDI r3, 77           ; M
LDI r8, 0x7402
STORE r8, r3
LDI r3, 67           ; C
LDI r8, 0x7403
STORE r8, r3
LDI r3, 80           ; P
LDI r8, 0x7404
STORE r8, r3
LDI r3, 89           ; Y
LDI r8, 0x7405
STORE r8, r3
LDI r3, 0            ; null terminator
LDI r8, 0x7406
STORE r8, r3
TEXT r0, r10, r11

; MEMSET label
LDI r0, 10
LDI r10, 120
LDI r3, 77           ; M
LDI r8, 0x7410
STORE r8, r3
LDI r3, 69           ; E
LDI r8, 0x7411
STORE r8, r3
LDI r3, 77           ; M
LDI r8, 0x7412
STORE r8, r3
LDI r3, 83           ; S
LDI r8, 0x7413
STORE r8, r3
LDI r3, 69           ; E
LDI r8, 0x7414
STORE r8, r3
LDI r3, 84           ; T
LDI r8, 0x7415
STORE r8, r3
LDI r3, 0
LDI r8, 0x7416
STORE r8, r3
LDI r11, 0x7410
TEXT r0, r10, r11

HALT

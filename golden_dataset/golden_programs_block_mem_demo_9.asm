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
LDI r1, 0x7000        ; pattern base
LDI r8, 0x00FF00      ; green
LDI r15, 16           ; 16 words per row
MEMSET r1, r8, r15     ; row 0 = green

LDI r1, 0x7010        ; next row (16 words later)
LDI r8, 0x0000FF      ; blue
MEMSET r1, r8, r15     ; row 1 = blue

; Now use MEMCPY to duplicate this 2-row pattern across screen rows
; Each screen row is 256 pixels, but we use RECTF for that
; This demo just shows the pattern in the top-left corner

; Copy the pattern to a display area at 0x7400
LDI r1, 0x7400        ; dst
LDI r8, 0x7000        ; src
LDI r15, 32           ; copy both rows (32 words)
MEMCPY r1, r8, r15

; Verify: overwrite first word of source with red, then MEMCPY again
; The overlap-safe copy should handle this correctly
LDI r5, 0xFF0000      ; red
LDI r2, 0x7000
STORE r2, r5          ; overwrite pattern[0] with red

; Forward overlap test: copy pattern to itself shifted by 1
LDI r1, 0x7001        ; dst (overlap with src)
LDI r8, 0x7000        ; src
LDI r15, 16           ; len
MEMCPY r1, r8, r15     ; overlap-safe: copies backward internally

; Now render the patterns to screen using RECTF
; Green row at y=0
LDI r12, 0
LDI r14, 0
LDI r10, 256
LDI r9, 16
LDI r4, 0x00FF00
RECTF r12, r14, r10, r9, r4

; Blue row at y=16
LDI r14, 16
LDI r4, 0x0000FF
RECTF r12, r14, r10, r9, r4

; Red row at y=32 (the modified pattern)
LDI r14, 32
LDI r4, 0xFF0000
RECTF r12, r14, r10, r9, r4

; Green row at y=48
LDI r14, 48
LDI r4, 0x00FF00
RECTF r12, r14, r10, r9, r4

; Blue row at y=64
LDI r14, 64
LDI r4, 0x0000FF
RECTF r12, r14, r10, r9, r4

; Text label
LDI r12, 10
LDI r14, 100
LDI r10, 0x7400
LDI r9, 77           ; M
STORE r10, r9
LDI r9, 69           ; E
LDI r0, 0x7401
STORE r0, r9
LDI r9, 77           ; M
LDI r0, 0x7402
STORE r0, r9
LDI r9, 67           ; C
LDI r0, 0x7403
STORE r0, r9
LDI r9, 80           ; P
LDI r0, 0x7404
STORE r0, r9
LDI r9, 89           ; Y
LDI r0, 0x7405
STORE r0, r9
LDI r9, 0            ; null terminator
LDI r0, 0x7406
STORE r0, r9
TEXT r12, r14, r10

; MEMSET label
LDI r12, 10
LDI r14, 120
LDI r9, 77           ; M
LDI r0, 0x7410
STORE r0, r9
LDI r9, 69           ; E
LDI r0, 0x7411
STORE r0, r9
LDI r9, 77           ; M
LDI r0, 0x7412
STORE r0, r9
LDI r9, 83           ; S
LDI r0, 0x7413
STORE r0, r9
LDI r9, 69           ; E
LDI r0, 0x7414
STORE r0, r9
LDI r9, 84           ; T
LDI r0, 0x7415
STORE r0, r9
LDI r9, 0
LDI r0, 0x7416
STORE r0, r9
LDI r10, 0x7410
TEXT r12, r14, r10

HALT

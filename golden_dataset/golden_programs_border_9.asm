; DESCRIPTION: Geometry OS program to draw a green rectangle.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r1, 0
LDI r14, 0
LDI r3, 256
LDI r4, 4
LDI r8, 0x00FF00
RECTF r1, r14, r3, r4, r8

; Bottom border
LDI r1, 0
LDI r14, 252
LDI r3, 256
LDI r4, 4
RECTF r1, r14, r3, r4, r8

; Left border
LDI r1, 0
LDI r14, 4
LDI r3, 4
LDI r4, 248
RECTF r1, r14, r3, r4, r8

; Right border
LDI r1, 252
LDI r14, 4
LDI r3, 4
LDI r4, 248
RECTF r1, r14, r3, r4, r8

HALT

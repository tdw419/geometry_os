; DESCRIPTION: Geometry OS program to draw a green rectangle.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r5, 0
LDI r15, 0
LDI r0, 256
LDI r13, 4
LDI r11, 0x00FF00
RECTF r5, r15, r0, r13, r11

; Bottom border
LDI r5, 0
LDI r15, 252
LDI r0, 256
LDI r13, 4
RECTF r5, r15, r0, r13, r11

; Left border
LDI r5, 0
LDI r15, 4
LDI r0, 4
LDI r13, 248
RECTF r5, r15, r0, r13, r11

; Right border
LDI r5, 252
LDI r15, 4
LDI r0, 4
LDI r13, 248
RECTF r5, r15, r0, r13, r11

HALT

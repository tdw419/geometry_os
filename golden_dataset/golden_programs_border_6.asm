; DESCRIPTION: Display a rectangle using color green at the screen.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r11, 0
LDI r1, 0
LDI r5, 256
LDI r10, 4
LDI r3, 0x00FF00
RECTF r11, r1, r5, r10, r3

; Bottom border
LDI r11, 0
LDI r1, 252
LDI r5, 256
LDI r10, 4
RECTF r11, r1, r5, r10, r3

; Left border
LDI r11, 0
LDI r1, 4
LDI r5, 4
LDI r10, 248
RECTF r11, r1, r5, r10, r3

; Right border
LDI r11, 252
LDI r1, 4
LDI r5, 4
LDI r10, 248
RECTF r11, r1, r5, r10, r3

HALT

; DESCRIPTION: Draw rectangle: pos=the screen, color=green, size=fixed size.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r10, 0
LDI r3, 0
LDI r5, 256
LDI r2, 4
LDI r11, 0x00FF00
RECTF r10, r3, r5, r2, r11

; Bottom border
LDI r10, 0
LDI r3, 252
LDI r5, 256
LDI r2, 4
RECTF r10, r3, r5, r2, r11

; Left border
LDI r10, 0
LDI r3, 4
LDI r5, 4
LDI r2, 248
RECTF r10, r3, r5, r2, r11

; Right border
LDI r10, 252
LDI r3, 4
LDI r5, 4
LDI r2, 248
RECTF r10, r3, r5, r2, r11

HALT

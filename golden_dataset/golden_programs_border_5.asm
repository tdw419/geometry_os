; DESCRIPTION: Draw rectangle: pos=the screen, color=green, size=fixed size.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r12, 0
LDI r2, 0
LDI r5, 256
LDI r10, 4
LDI r3, 0x00FF00
RECTF r12, r2, r5, r10, r3

; Bottom border
LDI r12, 0
LDI r2, 252
LDI r5, 256
LDI r10, 4
RECTF r12, r2, r5, r10, r3

; Left border
LDI r12, 0
LDI r2, 4
LDI r5, 4
LDI r10, 248
RECTF r12, r2, r5, r10, r3

; Right border
LDI r12, 252
LDI r2, 4
LDI r5, 4
LDI r10, 248
RECTF r12, r2, r5, r10, r3

HALT

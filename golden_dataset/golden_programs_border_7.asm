; DESCRIPTION: Render a green rectangle at the screen.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r1, 0
LDI r10, 0
LDI r6, 256
LDI r3, 4
LDI r5, 0x00FF00
RECTF r1, r10, r6, r3, r5

; Bottom border
LDI r1, 0
LDI r10, 252
LDI r6, 256
LDI r3, 4
RECTF r1, r10, r6, r3, r5

; Left border
LDI r1, 0
LDI r10, 4
LDI r6, 4
LDI r3, 248
RECTF r1, r10, r6, r3, r5

; Right border
LDI r1, 252
LDI r10, 4
LDI r6, 4
LDI r3, 248
RECTF r1, r10, r6, r3, r5

HALT

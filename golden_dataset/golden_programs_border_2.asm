; DESCRIPTION: This GeOS assembly code draws a green (0x00FF00) border around the screen edges using the RECTF function. The border consists of four rectangles: one at the top and bottom (each 4 pixels tall and full width), and two on the left and right (each 4 pixels wide and spanning the height minus the top and bottom borders). The center of the screen remains black.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r3, 0
LDI r7, 0
LDI r1, 256
LDI r10, 4
LDI r4, 0x00FF00
RECTF r3, r7, r1, r10, r4

; Bottom border
LDI r3, 0
LDI r7, 252
LDI r1, 256
LDI r10, 4
RECTF r3, r7, r1, r10, r4

; Left border
LDI r3, 0
LDI r7, 4
LDI r1, 4
LDI r10, 248
RECTF r3, r7, r1, r10, r4

; Right border
LDI r3, 252
LDI r7, 4
LDI r1, 4
LDI r10, 248
RECTF r3, r7, r1, r10, r4

HALT

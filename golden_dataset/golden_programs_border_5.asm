; DESCRIPTION: This GeOS assembly code draws a green (0x00FF00) border around the screen edges using the RECTF function. The border consists of four rectangles: one at the top and bottom (each 4 pixels tall and full width), and two on the left and right (each 4 pixels wide and spanning the height minus the top and bottom borders). The center of the screen remains black.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r5, 0
LDI r15, 0
LDI r3, 256
LDI r2, 4
LDI r0, 0x00FF00
RECTF r5, r15, r3, r2, r0

; Bottom border
LDI r5, 0
LDI r15, 252
LDI r3, 256
LDI r2, 4
RECTF r5, r15, r3, r2, r0

; Left border
LDI r5, 0
LDI r15, 4
LDI r3, 4
LDI r2, 248
RECTF r5, r15, r3, r2, r0

; Right border
LDI r5, 252
LDI r15, 4
LDI r3, 4
LDI r2, 248
RECTF r5, r15, r3, r2, r0

HALT

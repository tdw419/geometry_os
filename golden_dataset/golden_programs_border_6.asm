; DESCRIPTION: This GeOS assembly code draws a green (0x00FF00) border around the screen edges using the RECTF function. The border consists of four rectangles: one at the top and bottom (each 4 pixels tall and full width), and two on the left and right (each 4 pixels wide and spanning the height minus the top and bottom borders). The center of the screen remains black.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r0, 0
LDI r4, 0
LDI r13, 256
LDI r9, 4
LDI r8, 0x00FF00
RECTF r0, r4, r13, r9, r8

; Bottom border
LDI r0, 0
LDI r4, 252
LDI r13, 256
LDI r9, 4
RECTF r0, r4, r13, r9, r8

; Left border
LDI r0, 0
LDI r4, 4
LDI r13, 4
LDI r9, 248
RECTF r0, r4, r13, r9, r8

; Right border
LDI r0, 252
LDI r4, 4
LDI r13, 4
LDI r9, 248
RECTF r0, r4, r13, r9, r8

HALT

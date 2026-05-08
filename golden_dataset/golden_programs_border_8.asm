; DESCRIPTION: This GeOS assembly code draws a green (0x00FF00) border around the screen edges using the RECTF function. The border consists of four rectangles: one at the top and bottom (each 4 pixels tall and full width), and two on the left and right (each 4 pixels wide and spanning the height minus the top and bottom borders). The center of the screen remains black.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r0, 0
LDI r9, 0
LDI r14, 256
LDI r1, 4
LDI r15, 0x00FF00
RECTF r0, r9, r14, r1, r15

; Bottom border
LDI r0, 0
LDI r9, 252
LDI r14, 256
LDI r1, 4
RECTF r0, r9, r14, r1, r15

; Left border
LDI r0, 0
LDI r9, 4
LDI r14, 4
LDI r1, 248
RECTF r0, r9, r14, r1, r15

; Right border
LDI r0, 252
LDI r9, 4
LDI r14, 4
LDI r1, 248
RECTF r0, r9, r14, r1, r15

HALT

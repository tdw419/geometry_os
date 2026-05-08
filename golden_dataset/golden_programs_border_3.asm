; DESCRIPTION: This GeOS assembly code draws a green (0x00FF00) border around the screen edges using the RECTF function. The border consists of four rectangles: one at the top and bottom (each 4 pixels tall and full width), and two on the left and right (each 4 pixels wide and spanning the height minus the top and bottom borders). The center of the screen remains black.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r2, 0
LDI r6, 0
LDI r0, 256
LDI r5, 4
LDI r14, 0x00FF00
RECTF r2, r6, r0, r5, r14

; Bottom border
LDI r2, 0
LDI r6, 252
LDI r0, 256
LDI r5, 4
RECTF r2, r6, r0, r5, r14

; Left border
LDI r2, 0
LDI r6, 4
LDI r0, 4
LDI r5, 248
RECTF r2, r6, r0, r5, r14

; Right border
LDI r2, 252
LDI r6, 4
LDI r0, 4
LDI r5, 248
RECTF r2, r6, r0, r5, r14

HALT

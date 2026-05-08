; DESCRIPTION: This GeOS assembly code draws a green (0x00FF00) border around the screen edges using the RECTF function. The border consists of four rectangles: one at the top and bottom (each 4 pixels tall and full width), and two on the left and right (each 4 pixels wide and spanning the height minus the top and bottom borders). The center of the screen remains black.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r7, 0
LDI r6, 0
LDI r2, 256
LDI r13, 4
LDI r11, 0x00FF00
RECTF r7, r6, r2, r13, r11

; Bottom border
LDI r7, 0
LDI r6, 252
LDI r2, 256
LDI r13, 4
RECTF r7, r6, r2, r13, r11

; Left border
LDI r7, 0
LDI r6, 4
LDI r2, 4
LDI r13, 248
RECTF r7, r6, r2, r13, r11

; Right border
LDI r7, 252
LDI r6, 4
LDI r2, 4
LDI r13, 248
RECTF r7, r6, r2, r13, r11

HALT

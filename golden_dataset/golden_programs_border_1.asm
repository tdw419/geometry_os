; DESCRIPTION: Display a rectangle using color green at the screen.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r15, 0
LDI r3, 0
LDI r13, 256
LDI r8, 4
LDI r6, 0x00FF00
RECTF r15, r3, r13, r8, r6

; Bottom border
LDI r15, 0
LDI r3, 252
LDI r13, 256
LDI r8, 4
RECTF r15, r3, r13, r8, r6

; Left border
LDI r15, 0
LDI r3, 4
LDI r13, 4
LDI r8, 248
RECTF r15, r3, r13, r8, r6

; Right border
LDI r15, 252
LDI r3, 4
LDI r13, 4
LDI r8, 248
RECTF r15, r3, r13, r8, r6

HALT

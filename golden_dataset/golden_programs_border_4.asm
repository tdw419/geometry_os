; DESCRIPTION: A green rectangle centered at the screen with fixed size.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r14, 0
LDI r12, 0
LDI r9, 256
LDI r5, 4
LDI r15, 0x00FF00
RECTF r14, r12, r9, r5, r15

; Bottom border
LDI r14, 0
LDI r12, 252
LDI r9, 256
LDI r5, 4
RECTF r14, r12, r9, r5, r15

; Left border
LDI r14, 0
LDI r12, 4
LDI r9, 4
LDI r5, 248
RECTF r14, r12, r9, r5, r15

; Right border
LDI r14, 252
LDI r12, 4
LDI r9, 4
LDI r5, 248
RECTF r14, r12, r9, r5, r15

HALT

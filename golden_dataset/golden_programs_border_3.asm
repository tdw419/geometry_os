; DESCRIPTION: A green rectangle centered at the screen with fixed size.

; BORDER -- Draw a colored border around the screen edges
; Uses RECTF to draw borders on all four sides
; Test: border pixels should be green (0x00FF00), center should be black

; Top border: full width, 4 pixels tall
LDI r0, 0
LDI r7, 0
LDI r10, 256
LDI r12, 4
LDI r15, 0x00FF00
RECTF r0, r7, r10, r12, r15

; Bottom border
LDI r0, 0
LDI r7, 252
LDI r10, 256
LDI r12, 4
RECTF r0, r7, r10, r12, r15

; Left border
LDI r0, 0
LDI r7, 4
LDI r10, 4
LDI r12, 248
RECTF r0, r7, r10, r12, r15

; Right border
LDI r0, 252
LDI r7, 4
LDI r10, 4
LDI r12, 248
RECTF r0, r7, r10, r12, r15

HALT

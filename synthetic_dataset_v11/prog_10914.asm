; DESCRIPTION: Draws a blue rectangle at (126, 169) with width 68 and height 43.
; PLAN: r0=126(x), r1=169(y), r2=68(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 169
LDI r2, 68
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

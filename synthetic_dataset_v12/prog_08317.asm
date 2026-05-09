; DESCRIPTION: Draws a blue rectangle at (253, 94) with width 26 and height 43.
; PLAN: r0=253(x), r1=94(y), r2=26(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 94
LDI r2, 26
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

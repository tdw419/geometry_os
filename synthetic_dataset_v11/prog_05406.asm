; DESCRIPTION: Draws a blue rectangle at (47, 94) with width 68 and height 33.
; PLAN: r0=47(x), r1=94(y), r2=68(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 94
LDI r2, 68
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

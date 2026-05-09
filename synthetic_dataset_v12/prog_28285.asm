; DESCRIPTION: Draws a green rectangle at (62, 17) with width 45 and height 94.
; PLAN: r0=62(x), r1=17(y), r2=45(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 17
LDI r2, 45
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green rectangle at (62, 70) with width 78 and height 33.
; PLAN: r0=62(x), r1=70(y), r2=78(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 70
LDI r2, 78
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green rectangle at (170, 219) with width 70 and height 31.
; PLAN: r0=170(x), r1=219(y), r2=70(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 219
LDI r2, 70
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

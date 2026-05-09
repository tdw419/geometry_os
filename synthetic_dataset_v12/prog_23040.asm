; DESCRIPTION: Draws a green rectangle at (160, 98) with width 110 and height 36.
; PLAN: r0=160(x), r1=98(y), r2=110(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 98
LDI r2, 110
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

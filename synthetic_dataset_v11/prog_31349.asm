; DESCRIPTION: Draws a green rectangle at (192, 160) with width 52 and height 60.
; PLAN: r0=192(x), r1=160(y), r2=52(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 160
LDI r2, 52
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

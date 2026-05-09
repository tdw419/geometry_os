; DESCRIPTION: Draws a green rectangle at (192, 17) with width 57 and height 38.
; PLAN: r0=192(x), r1=17(y), r2=57(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 17
LDI r2, 57
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

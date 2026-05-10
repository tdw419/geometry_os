; DESCRIPTION: Draws a blue rectangle at (192, 54) with width 15 and height 102.
; PLAN: r0=192(x), r1=54(y), r2=15(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 54
LDI r2, 15
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

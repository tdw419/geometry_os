; DESCRIPTION: Draws a blue rectangle at (54, 52) with width 107 and height 83.
; PLAN: r0=54(x), r1=52(y), r2=107(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 52
LDI r2, 107
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

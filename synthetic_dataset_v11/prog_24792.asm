; DESCRIPTION: Draws a blue rectangle at (54, 34) with width 52 and height 74.
; PLAN: r0=54(x), r1=34(y), r2=52(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 34
LDI r2, 52
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

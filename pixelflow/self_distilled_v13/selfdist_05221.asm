; DESCRIPTION: Draws a blue rectangle at (233, 89) with width 12 and height 52.
; PLAN: r0=233(x), r1=89(y), r2=12(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 89
LDI r2, 12
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

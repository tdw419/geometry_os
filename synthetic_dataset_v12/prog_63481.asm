; DESCRIPTION: Draws a blue rectangle at (339, 65) with width 95 and height 54.
; PLAN: r0=339(x), r1=65(y), r2=95(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 65
LDI r2, 95
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

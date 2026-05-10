; DESCRIPTION: Draws a blue rectangle at (72, 123) with width 95 and height 117.
; PLAN: r0=72(x), r1=123(y), r2=95(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 123
LDI r2, 95
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

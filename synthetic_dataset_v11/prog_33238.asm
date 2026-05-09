; DESCRIPTION: Draws a blue rectangle at (137, 12) with width 117 and height 100.
; PLAN: r0=137(x), r1=12(y), r2=117(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 12
LDI r2, 117
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

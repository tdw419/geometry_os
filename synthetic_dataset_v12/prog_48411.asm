; DESCRIPTION: Draws a blue rectangle at (336, 135) with width 73 and height 30.
; PLAN: r0=336(x), r1=135(y), r2=73(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 135
LDI r2, 73
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

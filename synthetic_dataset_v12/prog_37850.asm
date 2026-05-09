; DESCRIPTION: Draws a blue rectangle at (321, 135) with width 101 and height 64.
; PLAN: r0=321(x), r1=135(y), r2=101(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 135
LDI r2, 101
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

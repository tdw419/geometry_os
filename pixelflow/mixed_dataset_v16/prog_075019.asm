; DESCRIPTION: Draws a blue rectangle at (189, 74) with width 119 and height 95.
; PLAN: r0=189(x), r1=74(y), r2=119(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 74
LDI r2, 119
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

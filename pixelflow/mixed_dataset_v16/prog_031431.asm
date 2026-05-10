; DESCRIPTION: Draws a blue rectangle at (165, 101) with width 76 and height 49.
; PLAN: r0=165(x), r1=101(y), r2=76(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 101
LDI r2, 76
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

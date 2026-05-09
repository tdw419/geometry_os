; DESCRIPTION: Draws a blue rectangle at (53, 183) with width 105 and height 31.
; PLAN: r0=53(x), r1=183(y), r2=105(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 183
LDI r2, 105
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

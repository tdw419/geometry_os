; DESCRIPTION: Draws a blue rectangle at (165, 167) with width 81 and height 38.
; PLAN: r0=165(x), r1=167(y), r2=81(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 167
LDI r2, 81
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

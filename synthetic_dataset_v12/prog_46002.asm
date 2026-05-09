; DESCRIPTION: Draws a green rectangle at (74, 181) with width 55 and height 64.
; PLAN: r0=74(x), r1=181(y), r2=55(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 181
LDI r2, 55
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

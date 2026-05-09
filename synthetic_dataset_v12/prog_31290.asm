; DESCRIPTION: Draws a green rectangle at (74, 159) with width 24 and height 92.
; PLAN: r0=74(x), r1=159(y), r2=24(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 159
LDI r2, 24
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

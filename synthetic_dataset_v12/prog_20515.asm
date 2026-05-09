; DESCRIPTION: Draws a green rectangle at (342, 100) with width 95 and height 19.
; PLAN: r0=342(x), r1=100(y), r2=95(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 100
LDI r2, 95
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

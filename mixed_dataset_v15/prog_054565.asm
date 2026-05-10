; DESCRIPTION: Draws a green rectangle at (95, 38) with width 101 and height 101.
; PLAN: r0=95(x), r1=38(y), r2=101(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 38
LDI r2, 101
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

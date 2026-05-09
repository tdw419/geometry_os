; DESCRIPTION: Draws a yellow rectangle at (95, 55) with width 61 and height 100.
; PLAN: r0=95(x), r1=55(y), r2=61(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 55
LDI r2, 61
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

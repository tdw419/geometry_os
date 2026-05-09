; DESCRIPTION: Draws a black rectangle at (95, 31) with width 102 and height 35.
; PLAN: r0=95(x), r1=31(y), r2=102(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 31
LDI r2, 102
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

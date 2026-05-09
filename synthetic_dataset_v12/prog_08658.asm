; DESCRIPTION: Draws a black rectangle at (25, 31) with width 14 and height 55.
; PLAN: r0=25(x), r1=31(y), r2=14(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 31
LDI r2, 14
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black rectangle at (184, 9) with width 55 and height 105.
; PLAN: r0=184(x), r1=9(y), r2=55(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 9
LDI r2, 55
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

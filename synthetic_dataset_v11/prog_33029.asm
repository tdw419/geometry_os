; DESCRIPTION: Draws a white rectangle at (17, 102) with width 55 and height 35.
; PLAN: r0=17(x), r1=102(y), r2=55(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 102
LDI r2, 55
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

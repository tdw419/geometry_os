; DESCRIPTION: Draws a black rectangle at (223, 77) with width 37 and height 55.
; PLAN: r0=223(x), r1=77(y), r2=37(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 77
LDI r2, 37
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

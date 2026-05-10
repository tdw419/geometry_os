; DESCRIPTION: Draws a white rectangle at (494, 46) with width 15 and height 33.
; PLAN: r0=494(x), r1=46(y), r2=15(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 46
LDI r2, 15
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

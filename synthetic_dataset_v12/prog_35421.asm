; DESCRIPTION: Draws a white rectangle at (5, 108) with width 18 and height 112.
; PLAN: r0=5(x), r1=108(y), r2=18(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 108
LDI r2, 18
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

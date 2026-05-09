; DESCRIPTION: Draws a white rectangle at (102, 91) with width 84 and height 11.
; PLAN: r0=102(x), r1=91(y), r2=84(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 91
LDI r2, 84
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

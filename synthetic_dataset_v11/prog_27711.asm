; DESCRIPTION: Draws a white rectangle at (66, 102) with width 52 and height 76.
; PLAN: r0=66(x), r1=102(y), r2=52(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 102
LDI r2, 52
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

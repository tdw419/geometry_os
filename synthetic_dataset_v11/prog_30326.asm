; DESCRIPTION: Draws a white rectangle at (89, 205) with width 102 and height 19.
; PLAN: r0=89(x), r1=205(y), r2=102(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 205
LDI r2, 102
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

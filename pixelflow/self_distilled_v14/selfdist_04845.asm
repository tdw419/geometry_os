; DESCRIPTION: Draws a white rectangle at (164, 169) with width 102 and height 84.
; PLAN: r0=164(x), r1=169(y), r2=102(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 169
LDI r2, 102
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

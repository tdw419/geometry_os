; DESCRIPTION: Draws a white rectangle at (33, 177) with width 115 and height 55.
; PLAN: r0=33(x), r1=177(y), r2=115(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 177
LDI r2, 115
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

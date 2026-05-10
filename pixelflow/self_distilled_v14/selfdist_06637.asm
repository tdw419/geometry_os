; DESCRIPTION: Draws a white rectangle at (121, 185) with width 83 and height 77.
; PLAN: r0=121(x), r1=185(y), r2=83(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 185
LDI r2, 83
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

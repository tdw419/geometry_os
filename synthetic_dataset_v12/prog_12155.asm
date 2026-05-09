; DESCRIPTION: Draws a white rectangle at (175, 167) with width 112 and height 31.
; PLAN: r0=175(x), r1=167(y), r2=112(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 167
LDI r2, 112
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

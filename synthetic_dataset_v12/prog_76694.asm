; DESCRIPTION: Draws a white rectangle at (175, 31) with width 29 and height 73.
; PLAN: r0=175(x), r1=31(y), r2=29(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 31
LDI r2, 29
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

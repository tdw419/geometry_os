; DESCRIPTION: Draws a white rectangle at (71, 66) with width 54 and height 35.
; PLAN: r0=71(x), r1=66(y), r2=54(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 66
LDI r2, 54
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

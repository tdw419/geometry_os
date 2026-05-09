; DESCRIPTION: Draws a white rectangle at (66, 14) with width 101 and height 53.
; PLAN: r0=66(x), r1=14(y), r2=101(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 14
LDI r2, 101
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (66, 19) with width 18 and height 53.
; PLAN: r0=66(x), r1=19(y), r2=18(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 19
LDI r2, 18
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

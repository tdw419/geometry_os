; DESCRIPTION: Draws a white rectangle at (19, 181) with width 66 and height 13.
; PLAN: r0=19(x), r1=181(y), r2=66(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 181
LDI r2, 66
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (381, 187) with width 78 and height 15.
; PLAN: r0=381(x), r1=187(y), r2=78(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 187
LDI r2, 78
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

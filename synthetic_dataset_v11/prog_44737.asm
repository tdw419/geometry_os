; DESCRIPTION: Draws a white rectangle at (78, 18) with width 34 and height 36.
; PLAN: r0=78(x), r1=18(y), r2=34(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 18
LDI r2, 34
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

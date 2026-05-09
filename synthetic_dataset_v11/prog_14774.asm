; DESCRIPTION: Draws a white rectangle at (18, 23) with width 25 and height 11.
; PLAN: r0=18(x), r1=23(y), r2=25(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 23
LDI r2, 25
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

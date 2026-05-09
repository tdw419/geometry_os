; DESCRIPTION: Draws a white rectangle at (2, 148) with width 97 and height 97.
; PLAN: r0=2(x), r1=148(y), r2=97(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 148
LDI r2, 97
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

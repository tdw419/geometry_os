; DESCRIPTION: Draws a white rectangle at (314, 172) with width 56 and height 62.
; PLAN: r0=314(x), r1=172(y), r2=56(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 172
LDI r2, 56
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

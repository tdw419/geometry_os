; DESCRIPTION: Draws a white rectangle at (314, 5) with width 43 and height 109.
; PLAN: r0=314(x), r1=5(y), r2=43(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 5
LDI r2, 43
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

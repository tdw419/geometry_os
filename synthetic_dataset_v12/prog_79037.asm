; DESCRIPTION: Draws a white rectangle at (37, 36) with width 88 and height 56.
; PLAN: r0=37(x), r1=36(y), r2=88(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 36
LDI r2, 88
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

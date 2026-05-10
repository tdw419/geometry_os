; DESCRIPTION: Draws a red rectangle at (49, 13) with width 78 and height 119.
; PLAN: r0=49(x), r1=13(y), r2=78(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 13
LDI r2, 78
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

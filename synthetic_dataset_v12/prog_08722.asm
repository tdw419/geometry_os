; DESCRIPTION: Draws a red rectangle at (37, 67) with width 20 and height 119.
; PLAN: r0=37(x), r1=67(y), r2=20(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 67
LDI r2, 20
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

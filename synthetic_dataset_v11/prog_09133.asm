; DESCRIPTION: Draws a green rectangle at (88, 21) with width 107 and height 70.
; PLAN: r0=88(x), r1=21(y), r2=107(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 21
LDI r2, 107
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

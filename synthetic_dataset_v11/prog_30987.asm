; DESCRIPTION: Draws a red rectangle at (49, 145) with width 119 and height 72.
; PLAN: r0=49(x), r1=145(y), r2=119(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 145
LDI r2, 119
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (216, 119) with width 119 and height 25.
; PLAN: r0=216(x), r1=119(y), r2=119(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 119
LDI r2, 119
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

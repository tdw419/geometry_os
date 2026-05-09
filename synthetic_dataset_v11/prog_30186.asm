; DESCRIPTION: Draws a red rectangle at (37, 65) with width 110 and height 100.
; PLAN: r0=37(x), r1=65(y), r2=110(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 65
LDI r2, 110
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

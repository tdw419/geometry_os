; DESCRIPTION: Draws a red rectangle at (169, 110) with width 80 and height 11.
; PLAN: r0=169(x), r1=110(y), r2=80(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 110
LDI r2, 80
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

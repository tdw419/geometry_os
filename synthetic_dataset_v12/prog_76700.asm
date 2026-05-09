; DESCRIPTION: Draws a red rectangle at (395, 31) with width 89 and height 110.
; PLAN: r0=395(x), r1=31(y), r2=89(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 31
LDI r2, 89
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

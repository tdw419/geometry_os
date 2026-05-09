; DESCRIPTION: Draws a red rectangle at (110, 119) with width 11 and height 38.
; PLAN: r0=110(x), r1=119(y), r2=11(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 119
LDI r2, 11
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

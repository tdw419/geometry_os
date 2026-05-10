; DESCRIPTION: Draws a red rectangle at (134, 6) with width 110 and height 80.
; PLAN: r0=134(x), r1=6(y), r2=110(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 6
LDI r2, 110
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

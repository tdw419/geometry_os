; DESCRIPTION: Draws a red rectangle at (89, 160) with width 11 and height 49.
; PLAN: r0=89(x), r1=160(y), r2=11(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 160
LDI r2, 11
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

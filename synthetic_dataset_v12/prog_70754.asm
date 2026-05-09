; DESCRIPTION: Draws a red rectangle at (208, 5) with width 110 and height 62.
; PLAN: r0=208(x), r1=5(y), r2=110(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 5
LDI r2, 110
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

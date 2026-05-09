; DESCRIPTION: Draws a red rectangle at (8, 45) with width 106 and height 10.
; PLAN: r0=8(x), r1=45(y), r2=106(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 45
LDI r2, 106
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

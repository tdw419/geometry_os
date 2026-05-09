; DESCRIPTION: Draws a green rectangle at (118, 0) with width 55 and height 85.
; PLAN: r0=118(x), r1=0(y), r2=55(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 0
LDI r2, 55
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

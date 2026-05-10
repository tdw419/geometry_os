; DESCRIPTION: Draws a green rectangle at (149, 2) with width 45 and height 36.
; PLAN: r0=149(x), r1=2(y), r2=45(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 2
LDI r2, 45
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green rectangle at (85, 6) with width 100 and height 34.
; PLAN: r0=85(x), r1=6(y), r2=100(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 6
LDI r2, 100
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

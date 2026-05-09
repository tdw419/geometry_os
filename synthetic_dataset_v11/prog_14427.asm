; DESCRIPTION: Draws a cyan rectangle at (2, 100) with width 89 and height 36.
; PLAN: r0=2(x), r1=100(y), r2=89(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 100
LDI r2, 89
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

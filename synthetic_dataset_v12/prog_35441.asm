; DESCRIPTION: Draws a cyan rectangle at (399, 85) with width 20 and height 106.
; PLAN: r0=399(x), r1=85(y), r2=20(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 85
LDI r2, 20
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

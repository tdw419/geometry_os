; DESCRIPTION: Draws a cyan rectangle at (100, 110) with width 19 and height 77.
; PLAN: r0=100(x), r1=110(y), r2=19(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 110
LDI r2, 19
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

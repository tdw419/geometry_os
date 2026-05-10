; DESCRIPTION: Draws a cyan rectangle at (266, 75) with width 100 and height 62.
; PLAN: r0=266(x), r1=75(y), r2=100(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 75
LDI r2, 100
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

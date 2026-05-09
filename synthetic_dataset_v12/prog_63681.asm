; DESCRIPTION: Draws a cyan rectangle at (232, 83) with width 85 and height 100.
; PLAN: r0=232(x), r1=83(y), r2=85(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 83
LDI r2, 85
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

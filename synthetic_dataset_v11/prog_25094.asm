; DESCRIPTION: Draws a cyan rectangle at (110, 50) with width 119 and height 116.
; PLAN: r0=110(x), r1=50(y), r2=119(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 50
LDI r2, 119
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

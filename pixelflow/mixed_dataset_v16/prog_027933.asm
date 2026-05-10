; DESCRIPTION: Draws a cyan rectangle at (47, 119) with width 31 and height 84.
; PLAN: r0=47(x), r1=119(y), r2=31(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 119
LDI r2, 31
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

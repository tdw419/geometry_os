; DESCRIPTION: Draws a cyan rectangle at (47, 208) with width 119 and height 45.
; PLAN: r0=47(x), r1=208(y), r2=119(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 208
LDI r2, 119
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

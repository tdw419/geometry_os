; DESCRIPTION: Draws a cyan rectangle at (186, 123) with width 84 and height 62.
; PLAN: r0=186(x), r1=123(y), r2=84(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 123
LDI r2, 84
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

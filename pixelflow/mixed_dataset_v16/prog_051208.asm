; DESCRIPTION: Draws a cyan rectangle at (427, 184) with width 54 and height 62.
; PLAN: r0=427(x), r1=184(y), r2=54(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 184
LDI r2, 54
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

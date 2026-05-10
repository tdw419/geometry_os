; DESCRIPTION: Draws a cyan rectangle at (270, 119) with width 108 and height 62.
; PLAN: r0=270(x), r1=119(y), r2=108(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 119
LDI r2, 108
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

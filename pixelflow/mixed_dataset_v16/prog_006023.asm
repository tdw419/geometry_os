; DESCRIPTION: Draws a cyan rectangle at (192, 232) with width 119 and height 16.
; PLAN: r0=192(x), r1=232(y), r2=119(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 232
LDI r2, 119
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

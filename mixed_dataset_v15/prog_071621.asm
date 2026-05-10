; DESCRIPTION: Draws a cyan rectangle at (192, 49) with width 11 and height 44.
; PLAN: r0=192(x), r1=49(y), r2=11(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 49
LDI r2, 11
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

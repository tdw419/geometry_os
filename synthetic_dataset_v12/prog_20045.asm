; DESCRIPTION: Draws a cyan rectangle at (136, 108) with width 114 and height 37.
; PLAN: r0=136(x), r1=108(y), r2=114(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 108
LDI r2, 114
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

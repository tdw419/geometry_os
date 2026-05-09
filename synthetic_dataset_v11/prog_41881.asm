; DESCRIPTION: Draws a cyan rectangle at (144, 84) with width 112 and height 83.
; PLAN: r0=144(x), r1=84(y), r2=112(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 84
LDI r2, 112
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

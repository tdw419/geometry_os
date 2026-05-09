; DESCRIPTION: Draws a cyan rectangle at (144, 70) with width 73 and height 84.
; PLAN: r0=144(x), r1=70(y), r2=73(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 70
LDI r2, 73
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

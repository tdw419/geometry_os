; DESCRIPTION: Draws a cyan rectangle at (261, 156) with width 22 and height 66.
; PLAN: r0=261(x), r1=156(y), r2=22(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 156
LDI r2, 22
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

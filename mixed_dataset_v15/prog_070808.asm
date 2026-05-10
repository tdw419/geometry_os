; DESCRIPTION: Draws a cyan rectangle at (145, 101) with width 31 and height 97.
; PLAN: r0=145(x), r1=101(y), r2=31(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 101
LDI r2, 31
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

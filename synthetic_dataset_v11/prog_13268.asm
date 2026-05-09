; DESCRIPTION: Draws a cyan rectangle at (105, 23) with width 31 and height 97.
; PLAN: r0=105(x), r1=23(y), r2=31(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 23
LDI r2, 31
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

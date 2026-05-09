; DESCRIPTION: Draws a cyan rectangle at (153, 100) with width 97 and height 97.
; PLAN: r0=153(x), r1=100(y), r2=97(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 100
LDI r2, 97
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan rectangle at (55, 122) with width 99 and height 94.
; PLAN: r0=55(x), r1=122(y), r2=99(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 122
LDI r2, 99
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

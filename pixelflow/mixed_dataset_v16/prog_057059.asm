; DESCRIPTION: Draws a cyan rectangle at (35, 122) with width 22 and height 86.
; PLAN: r0=35(x), r1=122(y), r2=22(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 122
LDI r2, 22
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

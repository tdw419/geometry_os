; DESCRIPTION: Draws a cyan rectangle at (345, 122) with width 88 and height 49.
; PLAN: r0=345(x), r1=122(y), r2=88(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 122
LDI r2, 88
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

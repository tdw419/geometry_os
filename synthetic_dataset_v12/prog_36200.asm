; DESCRIPTION: Draws a cyan rectangle at (22, 54) with width 99 and height 98.
; PLAN: r0=22(x), r1=54(y), r2=99(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 54
LDI r2, 99
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

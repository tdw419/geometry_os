; DESCRIPTION: Draws a yellow rectangle at (180, 49) with width 73 and height 99.
; PLAN: r0=180(x), r1=49(y), r2=73(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 49
LDI r2, 73
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

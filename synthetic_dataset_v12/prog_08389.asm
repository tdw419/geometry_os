; DESCRIPTION: Draws a purple rectangle at (188, 68) with width 58 and height 46.
; PLAN: r0=188(x), r1=68(y), r2=58(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 68
LDI r2, 58
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

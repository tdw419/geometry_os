; DESCRIPTION: Draws a purple rectangle at (196, 16) with width 54 and height 88.
; PLAN: r0=196(x), r1=16(y), r2=54(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 16
LDI r2, 54
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

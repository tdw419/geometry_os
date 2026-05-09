; DESCRIPTION: Renders a blue box of size 99x58 starting at (135, 88).
; PLAN: r0=135(x), r1=88(y), r2=99(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 88
LDI r2, 99
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

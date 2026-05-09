; DESCRIPTION: Renders a blue box of size 99x101 starting at (39, 80).
; PLAN: r0=39(x), r1=80(y), r2=99(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 80
LDI r2, 99
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

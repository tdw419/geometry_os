; DESCRIPTION: Renders a blue box of size 18x10 starting at (84, 136).
; PLAN: r0=84(x), r1=136(y), r2=18(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 136
LDI r2, 18
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

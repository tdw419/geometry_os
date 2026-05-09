; DESCRIPTION: Renders a green box of size 80x101 starting at (112, 1).
; PLAN: r0=112(x), r1=1(y), r2=80(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 1
LDI r2, 80
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

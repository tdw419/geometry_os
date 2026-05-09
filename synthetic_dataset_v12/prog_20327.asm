; DESCRIPTION: Renders a yellow box of size 80x96 starting at (56, 85).
; PLAN: r0=56(x), r1=85(y), r2=80(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 85
LDI r2, 80
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

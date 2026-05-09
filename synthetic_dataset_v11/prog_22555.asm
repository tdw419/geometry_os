; DESCRIPTION: Renders a yellow box of size 97x66 starting at (109, 2).
; PLAN: r0=109(x), r1=2(y), r2=97(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 2
LDI r2, 97
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

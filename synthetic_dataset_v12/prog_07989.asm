; DESCRIPTION: Renders a yellow box of size 81x119 starting at (94, 112).
; PLAN: r0=94(x), r1=112(y), r2=81(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 112
LDI r2, 81
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

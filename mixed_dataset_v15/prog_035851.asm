; DESCRIPTION: Renders a yellow box of size 11x34 starting at (453, 45).
; PLAN: r0=453(x), r1=45(y), r2=11(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 45
LDI r2, 11
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

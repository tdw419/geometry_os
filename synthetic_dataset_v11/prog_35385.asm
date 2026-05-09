; DESCRIPTION: Renders a yellow box of size 31x19 starting at (78, 147).
; PLAN: r0=78(x), r1=147(y), r2=31(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 147
LDI r2, 31
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

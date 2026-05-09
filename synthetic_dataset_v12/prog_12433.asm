; DESCRIPTION: Renders a yellow box of size 110x89 starting at (147, 164).
; PLAN: r0=147(x), r1=164(y), r2=110(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 164
LDI r2, 110
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

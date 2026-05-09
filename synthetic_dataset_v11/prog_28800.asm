; DESCRIPTION: Renders a yellow box of size 78x72 starting at (147, 17).
; PLAN: r0=147(x), r1=17(y), r2=78(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 17
LDI r2, 78
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

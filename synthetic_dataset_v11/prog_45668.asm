; DESCRIPTION: Renders a black line between points (15, 156) and (122, 234).
; PLAN: r0=15(x1), r1=156(y1), r2=122(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 156
LDI r2, 122
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

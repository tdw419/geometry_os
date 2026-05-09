; DESCRIPTION: Renders a black line between points (111, 191) and (122, 2).
; PLAN: r0=111(x1), r1=191(y1), r2=122(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 191
LDI r2, 122
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

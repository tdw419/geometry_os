; DESCRIPTION: Renders a black line between points (36, 17) and (212, 124).
; PLAN: r0=36(x1), r1=17(y1), r2=212(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 17
LDI r2, 212
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

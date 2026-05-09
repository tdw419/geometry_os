; DESCRIPTION: Renders a black line between points (124, 17) and (56, 82).
; PLAN: r0=124(x1), r1=17(y1), r2=56(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 17
LDI r2, 56
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

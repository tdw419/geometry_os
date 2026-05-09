; DESCRIPTION: Renders a black line between points (417, 241) and (278, 124).
; PLAN: r0=417(x1), r1=241(y1), r2=278(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 241
LDI r2, 278
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (376, 163) and (417, 1).
; PLAN: r0=376(x1), r1=163(y1), r2=417(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 163
LDI r2, 417
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

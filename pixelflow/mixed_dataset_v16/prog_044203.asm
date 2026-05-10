; DESCRIPTION: Renders a black line between points (83, 182) and (236, 19).
; PLAN: r0=83(x1), r1=182(y1), r2=236(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 182
LDI r2, 236
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (321, 84) and (204, 177).
; PLAN: r0=321(x1), r1=84(y1), r2=204(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 84
LDI r2, 204
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

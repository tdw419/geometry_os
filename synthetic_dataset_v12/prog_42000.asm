; DESCRIPTION: Renders a black line between points (266, 34) and (229, 177).
; PLAN: r0=266(x1), r1=34(y1), r2=229(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 34
LDI r2, 229
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (6, 31) and (177, 214).
; PLAN: r0=6(x1), r1=31(y1), r2=177(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 31
LDI r2, 177
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

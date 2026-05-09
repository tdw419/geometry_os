; DESCRIPTION: Renders a black line between points (355, 177) and (121, 77).
; PLAN: r0=355(x1), r1=177(y1), r2=121(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 177
LDI r2, 121
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (112, 54) and (221, 116).
; PLAN: r0=112(x1), r1=54(y1), r2=221(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 54
LDI r2, 221
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

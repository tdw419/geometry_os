; DESCRIPTION: Renders a black line between points (221, 95) and (17, 169).
; PLAN: r0=221(x1), r1=95(y1), r2=17(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 95
LDI r2, 17
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

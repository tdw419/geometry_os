; DESCRIPTION: Renders a black line between points (34, 218) and (235, 80).
; PLAN: r0=34(x1), r1=218(y1), r2=235(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 218
LDI r2, 235
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

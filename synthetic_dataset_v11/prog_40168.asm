; DESCRIPTION: Renders a black line between points (36, 79) and (139, 235).
; PLAN: r0=36(x1), r1=79(y1), r2=139(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 79
LDI r2, 139
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

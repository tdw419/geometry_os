; DESCRIPTION: Places a black line segment connecting (235, 92) to (201, 82).
; PLAN: r0=235(x1), r1=92(y1), r2=201(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 92
LDI r2, 201
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

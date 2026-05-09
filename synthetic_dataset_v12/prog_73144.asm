; DESCRIPTION: Renders a black line between points (235, 95) and (119, 207).
; PLAN: r0=235(x1), r1=95(y1), r2=119(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 95
LDI r2, 119
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

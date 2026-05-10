; DESCRIPTION: Renders a black line between points (207, 218) and (4, 235).
; PLAN: r0=207(x1), r1=218(y1), r2=4(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 218
LDI r2, 4
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

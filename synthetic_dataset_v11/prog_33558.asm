; DESCRIPTION: Renders a black line between points (126, 118) and (26, 235).
; PLAN: r0=126(x1), r1=118(y1), r2=26(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 118
LDI r2, 26
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (126, 75) and (235, 5).
; PLAN: r0=126(x1), r1=75(y1), r2=235(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 75
LDI r2, 235
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

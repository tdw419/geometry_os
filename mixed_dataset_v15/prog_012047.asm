; DESCRIPTION: Renders a green line between points (145, 30) and (489, 235).
; PLAN: r0=145(x1), r1=30(y1), r2=489(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 30
LDI r2, 489
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

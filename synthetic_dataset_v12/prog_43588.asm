; DESCRIPTION: Renders a green line between points (235, 5) and (203, 185).
; PLAN: r0=235(x1), r1=5(y1), r2=203(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 5
LDI r2, 203
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

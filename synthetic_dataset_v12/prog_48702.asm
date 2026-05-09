; DESCRIPTION: Renders a green line between points (358, 211) and (450, 235).
; PLAN: r0=358(x1), r1=211(y1), r2=450(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 211
LDI r2, 450
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

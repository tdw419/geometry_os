; DESCRIPTION: Renders a white line between points (192, 87) and (489, 235).
; PLAN: r0=192(x1), r1=87(y1), r2=489(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 87
LDI r2, 489
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (417, 180) to (177, 169).
; PLAN: r0=417(x1), r1=180(y1), r2=177(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 180
LDI r2, 177
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (235, 95) to (279, 169).
; PLAN: r0=235(x1), r1=95(y1), r2=279(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 95
LDI r2, 279
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

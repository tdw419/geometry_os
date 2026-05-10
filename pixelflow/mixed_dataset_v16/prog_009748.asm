; DESCRIPTION: Places a red line segment connecting (431, 182) to (5, 235).
; PLAN: r0=431(x1), r1=182(y1), r2=5(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 182
LDI r2, 5
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

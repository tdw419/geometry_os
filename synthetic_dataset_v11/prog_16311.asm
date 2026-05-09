; DESCRIPTION: Places a red line segment connecting (235, 2) to (71, 71).
; PLAN: r0=235(x1), r1=2(y1), r2=71(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 2
LDI r2, 71
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (88, 182) and (235, 218).
; PLAN: r0=88(x1), r1=182(y1), r2=235(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 182
LDI r2, 235
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (458, 49) and (193, 235).
; PLAN: r0=458(x1), r1=49(y1), r2=193(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 49
LDI r2, 193
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (317, 235) and (167, 78).
; PLAN: r0=317(x1), r1=235(y1), r2=167(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 235
LDI r2, 167
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

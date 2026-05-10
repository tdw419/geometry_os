; DESCRIPTION: Renders a red line between points (47, 0) and (360, 235).
; PLAN: r0=47(x1), r1=0(y1), r2=360(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 0
LDI r2, 360
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

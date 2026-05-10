; DESCRIPTION: Renders a red line segment connecting (184, 110) to (235, 93).
; PLAN: r0=184(x1), r1=110(y1), r2=235(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 110
LDI r2, 235
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

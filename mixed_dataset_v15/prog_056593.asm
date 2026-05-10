; DESCRIPTION: Renders a red line between points (369, 235) and (46, 10).
; PLAN: r0=369(x1), r1=235(y1), r2=46(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 235
LDI r2, 46
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

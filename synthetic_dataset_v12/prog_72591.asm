; DESCRIPTION: Renders a red line between points (235, 116) and (402, 136).
; PLAN: r0=235(x1), r1=116(y1), r2=402(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 116
LDI r2, 402
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (509, 235) and (37, 136).
; PLAN: r0=509(x1), r1=235(y1), r2=37(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 235
LDI r2, 37
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

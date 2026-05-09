; DESCRIPTION: Renders a red line between points (453, 148) and (318, 132).
; PLAN: r0=453(x1), r1=148(y1), r2=318(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 148
LDI r2, 318
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

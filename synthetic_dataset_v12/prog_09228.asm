; DESCRIPTION: Renders a red line between points (308, 248) and (453, 130).
; PLAN: r0=308(x1), r1=248(y1), r2=453(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 248
LDI r2, 453
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

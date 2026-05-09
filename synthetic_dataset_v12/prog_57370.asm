; DESCRIPTION: Renders a orange line between points (453, 48) and (351, 250).
; PLAN: r0=453(x1), r1=48(y1), r2=351(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 48
LDI r2, 351
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

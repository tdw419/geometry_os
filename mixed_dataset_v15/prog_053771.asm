; DESCRIPTION: Renders a black line between points (47, 174) and (453, 76).
; PLAN: r0=47(x1), r1=174(y1), r2=453(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 174
LDI r2, 453
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

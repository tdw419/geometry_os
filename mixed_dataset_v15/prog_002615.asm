; DESCRIPTION: Renders a black line between points (83, 206) and (169, 156).
; PLAN: r0=83(x1), r1=206(y1), r2=169(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 206
LDI r2, 169
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

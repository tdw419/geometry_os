; DESCRIPTION: Renders a black line between points (169, 55) and (211, 75).
; PLAN: r0=169(x1), r1=55(y1), r2=211(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 55
LDI r2, 211
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

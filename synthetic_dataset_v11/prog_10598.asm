; DESCRIPTION: Renders a black line between points (169, 44) and (45, 234).
; PLAN: r0=169(x1), r1=44(y1), r2=45(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 44
LDI r2, 45
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

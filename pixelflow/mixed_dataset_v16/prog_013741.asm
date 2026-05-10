; DESCRIPTION: Renders a yellow line between points (250, 47) and (142, 234).
; PLAN: r0=250(x1), r1=47(y1), r2=142(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 47
LDI r2, 142
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

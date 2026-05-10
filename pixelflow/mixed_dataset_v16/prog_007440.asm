; DESCRIPTION: Renders a blue line between points (112, 161) and (325, 55).
; PLAN: r0=112(x1), r1=161(y1), r2=325(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 161
LDI r2, 325
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

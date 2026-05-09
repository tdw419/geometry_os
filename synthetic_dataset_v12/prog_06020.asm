; DESCRIPTION: Renders a yellow line between points (234, 133) and (45, 250).
; PLAN: r0=234(x1), r1=133(y1), r2=45(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 133
LDI r2, 45
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (62, 182) and (234, 89).
; PLAN: r0=62(x1), r1=182(y1), r2=234(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 182
LDI r2, 234
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (31, 193) and (133, 45).
; PLAN: r0=31(x1), r1=193(y1), r2=133(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 193
LDI r2, 133
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

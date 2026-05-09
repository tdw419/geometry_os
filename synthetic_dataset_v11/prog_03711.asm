; DESCRIPTION: Renders a green line between points (189, 193) and (185, 89).
; PLAN: r0=189(x1), r1=193(y1), r2=185(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 193
LDI r2, 185
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

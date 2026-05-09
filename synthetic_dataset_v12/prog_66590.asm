; DESCRIPTION: Renders a green line between points (437, 110) and (58, 140).
; PLAN: r0=437(x1), r1=110(y1), r2=58(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 110
LDI r2, 58
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

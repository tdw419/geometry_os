; DESCRIPTION: Renders a green line between points (437, 159) and (266, 58).
; PLAN: r0=437(x1), r1=159(y1), r2=266(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 159
LDI r2, 266
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

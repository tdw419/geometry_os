; DESCRIPTION: Renders a green line between points (441, 98) and (93, 145).
; PLAN: r0=441(x1), r1=98(y1), r2=93(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 98
LDI r2, 93
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

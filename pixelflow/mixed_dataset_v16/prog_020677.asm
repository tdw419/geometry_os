; DESCRIPTION: Renders a yellow line between points (433, 71) and (140, 238).
; PLAN: r0=433(x1), r1=71(y1), r2=140(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 71
LDI r2, 140
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

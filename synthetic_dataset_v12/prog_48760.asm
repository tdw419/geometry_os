; DESCRIPTION: Renders a green line between points (141, 80) and (12, 140).
; PLAN: r0=141(x1), r1=80(y1), r2=12(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 80
LDI r2, 12
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

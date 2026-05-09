; DESCRIPTION: Renders a purple line between points (223, 24) and (4, 193).
; PLAN: r0=223(x1), r1=24(y1), r2=4(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 24
LDI r2, 4
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

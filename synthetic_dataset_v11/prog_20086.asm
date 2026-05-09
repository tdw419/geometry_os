; DESCRIPTION: Renders a purple line between points (198, 80) and (93, 134).
; PLAN: r0=198(x1), r1=80(y1), r2=93(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 80
LDI r2, 93
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

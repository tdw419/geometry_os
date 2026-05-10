; DESCRIPTION: Renders a purple line between points (115, 131) and (48, 133).
; PLAN: r0=115(x1), r1=131(y1), r2=48(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 131
LDI r2, 48
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

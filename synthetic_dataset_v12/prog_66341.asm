; DESCRIPTION: Renders a purple line between points (206, 163) and (363, 53).
; PLAN: r0=206(x1), r1=163(y1), r2=363(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 163
LDI r2, 363
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (363, 69) and (61, 96).
; PLAN: r0=363(x1), r1=69(y1), r2=61(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 69
LDI r2, 61
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

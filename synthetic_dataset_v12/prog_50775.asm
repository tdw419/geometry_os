; DESCRIPTION: Renders a purple line between points (427, 131) and (206, 250).
; PLAN: r0=427(x1), r1=131(y1), r2=206(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 131
LDI r2, 206
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

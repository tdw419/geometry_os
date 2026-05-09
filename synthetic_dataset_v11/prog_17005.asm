; DESCRIPTION: Renders a purple line between points (5, 131) and (225, 221).
; PLAN: r0=5(x1), r1=131(y1), r2=225(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 131
LDI r2, 225
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

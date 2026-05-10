; DESCRIPTION: Renders a purple line between points (352, 131) and (201, 252).
; PLAN: r0=352(x1), r1=131(y1), r2=201(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 131
LDI r2, 201
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (68, 131) and (288, 204).
; PLAN: r0=68(x1), r1=131(y1), r2=288(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 131
LDI r2, 288
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (131, 226) and (241, 212).
; PLAN: r0=131(x1), r1=226(y1), r2=241(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 226
LDI r2, 241
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (72, 31) and (131, 193).
; PLAN: r0=72(x1), r1=31(y1), r2=131(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 31
LDI r2, 131
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

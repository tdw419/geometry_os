; DESCRIPTION: Renders a purple line between points (96, 131) and (73, 234).
; PLAN: r0=96(x1), r1=131(y1), r2=73(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 131
LDI r2, 73
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

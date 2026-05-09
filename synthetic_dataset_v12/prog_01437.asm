; DESCRIPTION: Renders a purple line between points (45, 131) and (229, 83).
; PLAN: r0=45(x1), r1=131(y1), r2=229(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 131
LDI r2, 229
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

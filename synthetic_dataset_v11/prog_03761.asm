; DESCRIPTION: Places a purple line segment connecting (247, 45) to (133, 223).
; PLAN: r0=247(x1), r1=45(y1), r2=133(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 45
LDI r2, 133
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

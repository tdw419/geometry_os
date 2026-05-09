; DESCRIPTION: Places a purple line segment connecting (212, 96) to (141, 180).
; PLAN: r0=212(x1), r1=96(y1), r2=141(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 96
LDI r2, 141
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

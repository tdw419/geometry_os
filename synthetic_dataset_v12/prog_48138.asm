; DESCRIPTION: Places a blue line segment connecting (124, 185) to (449, 190).
; PLAN: r0=124(x1), r1=185(y1), r2=449(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 185
LDI r2, 449
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

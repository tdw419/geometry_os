; DESCRIPTION: Places a blue line segment connecting (23, 45) to (194, 190).
; PLAN: r0=23(x1), r1=45(y1), r2=194(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 45
LDI r2, 194
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

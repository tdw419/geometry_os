; DESCRIPTION: Places a blue line segment connecting (194, 217) to (487, 61).
; PLAN: r0=194(x1), r1=217(y1), r2=487(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 217
LDI r2, 487
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (377, 150) to (247, 48).
; PLAN: r0=377(x1), r1=150(y1), r2=247(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 150
LDI r2, 247
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

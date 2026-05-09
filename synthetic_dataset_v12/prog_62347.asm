; DESCRIPTION: Places a blue line segment connecting (247, 48) to (373, 179).
; PLAN: r0=247(x1), r1=48(y1), r2=373(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 48
LDI r2, 373
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (264, 217) to (249, 168).
; PLAN: r0=264(x1), r1=217(y1), r2=249(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 217
LDI r2, 249
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

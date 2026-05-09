; DESCRIPTION: Places a green line segment connecting (369, 80) to (216, 226).
; PLAN: r0=369(x1), r1=80(y1), r2=216(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 80
LDI r2, 216
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

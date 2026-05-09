; DESCRIPTION: Places a green line segment connecting (142, 145) to (232, 243).
; PLAN: r0=142(x1), r1=145(y1), r2=232(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 145
LDI r2, 232
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

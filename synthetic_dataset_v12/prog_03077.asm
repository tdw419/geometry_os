; DESCRIPTION: Places a blue line segment connecting (468, 192) to (454, 146).
; PLAN: r0=468(x1), r1=192(y1), r2=454(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 192
LDI r2, 454
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

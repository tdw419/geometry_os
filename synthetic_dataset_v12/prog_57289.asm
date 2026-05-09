; DESCRIPTION: Places a blue line segment connecting (420, 63) to (251, 34).
; PLAN: r0=420(x1), r1=63(y1), r2=251(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 63
LDI r2, 251
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

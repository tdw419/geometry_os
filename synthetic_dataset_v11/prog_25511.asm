; DESCRIPTION: Places a blue line segment connecting (190, 35) to (213, 145).
; PLAN: r0=190(x1), r1=35(y1), r2=213(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 35
LDI r2, 213
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (256, 118) to (404, 145).
; PLAN: r0=256(x1), r1=118(y1), r2=404(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 118
LDI r2, 404
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

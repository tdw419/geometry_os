; DESCRIPTION: Places a blue line segment connecting (392, 98) to (155, 162).
; PLAN: r0=392(x1), r1=98(y1), r2=155(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 98
LDI r2, 155
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

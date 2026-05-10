; DESCRIPTION: Places a blue line segment connecting (145, 56) to (260, 29).
; PLAN: r0=145(x1), r1=56(y1), r2=260(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 56
LDI r2, 260
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

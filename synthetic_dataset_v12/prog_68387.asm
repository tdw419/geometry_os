; DESCRIPTION: Places a blue line segment connecting (159, 144) to (1, 152).
; PLAN: r0=159(x1), r1=144(y1), r2=1(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 144
LDI r2, 1
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (158, 152) to (254, 84).
; PLAN: r0=158(x1), r1=152(y1), r2=254(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 152
LDI r2, 254
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

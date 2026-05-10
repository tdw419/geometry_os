; DESCRIPTION: Places a blue line segment connecting (370, 38) to (356, 85).
; PLAN: r0=370(x1), r1=38(y1), r2=356(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 38
LDI r2, 356
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

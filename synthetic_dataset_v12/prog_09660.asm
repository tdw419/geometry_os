; DESCRIPTION: Places a blue line segment connecting (87, 180) to (453, 34).
; PLAN: r0=87(x1), r1=180(y1), r2=453(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 180
LDI r2, 453
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

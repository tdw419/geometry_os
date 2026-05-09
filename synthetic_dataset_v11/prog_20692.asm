; DESCRIPTION: Places a blue line segment connecting (95, 237) to (110, 135).
; PLAN: r0=95(x1), r1=237(y1), r2=110(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 237
LDI r2, 110
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

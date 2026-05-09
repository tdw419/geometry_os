; DESCRIPTION: Places a blue line segment connecting (220, 133) to (199, 237).
; PLAN: r0=220(x1), r1=133(y1), r2=199(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 133
LDI r2, 199
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

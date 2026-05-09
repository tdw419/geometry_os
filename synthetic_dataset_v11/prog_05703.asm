; DESCRIPTION: Places a blue line segment connecting (172, 148) to (176, 51).
; PLAN: r0=172(x1), r1=148(y1), r2=176(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 148
LDI r2, 176
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (180, 140) to (491, 212).
; PLAN: r0=180(x1), r1=140(y1), r2=491(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 140
LDI r2, 491
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

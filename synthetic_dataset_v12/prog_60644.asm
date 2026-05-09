; DESCRIPTION: Places a blue line segment connecting (222, 150) to (24, 7).
; PLAN: r0=222(x1), r1=150(y1), r2=24(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 150
LDI r2, 24
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

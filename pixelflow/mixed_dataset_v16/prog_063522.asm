; DESCRIPTION: Places a blue line segment connecting (162, 23) to (346, 185).
; PLAN: r0=162(x1), r1=23(y1), r2=346(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 23
LDI r2, 346
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

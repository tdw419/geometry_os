; DESCRIPTION: Places a blue line segment connecting (277, 229) to (64, 31).
; PLAN: r0=277(x1), r1=229(y1), r2=64(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 229
LDI r2, 64
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (221, 58) to (466, 64).
; PLAN: r0=221(x1), r1=58(y1), r2=466(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 58
LDI r2, 466
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

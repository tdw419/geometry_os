; DESCRIPTION: Places a blue line segment connecting (448, 138) to (368, 61).
; PLAN: r0=448(x1), r1=138(y1), r2=368(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 138
LDI r2, 368
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

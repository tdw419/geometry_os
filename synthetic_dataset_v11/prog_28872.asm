; DESCRIPTION: Places a blue line segment connecting (107, 118) to (236, 10).
; PLAN: r0=107(x1), r1=118(y1), r2=236(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 118
LDI r2, 236
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

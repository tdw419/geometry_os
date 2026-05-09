; DESCRIPTION: Places a blue line segment connecting (115, 93) to (3, 145).
; PLAN: r0=115(x1), r1=93(y1), r2=3(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 93
LDI r2, 3
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

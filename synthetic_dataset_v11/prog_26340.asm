; DESCRIPTION: Places a blue line segment connecting (247, 251) to (49, 87).
; PLAN: r0=247(x1), r1=251(y1), r2=49(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 251
LDI r2, 49
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

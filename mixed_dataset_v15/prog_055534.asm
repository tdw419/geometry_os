; DESCRIPTION: Places a blue line segment connecting (60, 97) to (431, 177).
; PLAN: r0=60(x1), r1=97(y1), r2=431(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 97
LDI r2, 431
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

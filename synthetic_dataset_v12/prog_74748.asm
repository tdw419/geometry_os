; DESCRIPTION: Places a blue line segment connecting (114, 199) to (226, 212).
; PLAN: r0=114(x1), r1=199(y1), r2=226(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 199
LDI r2, 226
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

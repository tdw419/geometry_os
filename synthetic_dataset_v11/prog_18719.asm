; DESCRIPTION: Places a purple line segment connecting (45, 143) to (79, 133).
; PLAN: r0=45(x1), r1=143(y1), r2=79(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 143
LDI r2, 79
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

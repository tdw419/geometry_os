; DESCRIPTION: Places a purple line segment connecting (79, 46) to (3, 206).
; PLAN: r0=79(x1), r1=46(y1), r2=3(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 46
LDI r2, 3
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

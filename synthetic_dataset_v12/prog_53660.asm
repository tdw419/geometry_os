; DESCRIPTION: Places a magenta line segment connecting (133, 160) to (143, 250).
; PLAN: r0=133(x1), r1=160(y1), r2=143(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 160
LDI r2, 143
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

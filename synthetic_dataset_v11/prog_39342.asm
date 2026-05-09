; DESCRIPTION: Places a magenta line segment connecting (241, 198) to (140, 133).
; PLAN: r0=241(x1), r1=198(y1), r2=140(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 198
LDI r2, 140
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

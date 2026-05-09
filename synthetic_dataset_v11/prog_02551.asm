; DESCRIPTION: Places a magenta line segment connecting (133, 73) to (14, 51).
; PLAN: r0=133(x1), r1=73(y1), r2=14(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 73
LDI r2, 14
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

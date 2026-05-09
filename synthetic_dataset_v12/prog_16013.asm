; DESCRIPTION: Places a magenta line segment connecting (389, 236) to (511, 109).
; PLAN: r0=389(x1), r1=236(y1), r2=511(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 236
LDI r2, 511
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

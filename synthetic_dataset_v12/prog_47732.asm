; DESCRIPTION: Places a magenta line segment connecting (4, 195) to (53, 145).
; PLAN: r0=4(x1), r1=195(y1), r2=53(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 195
LDI r2, 53
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

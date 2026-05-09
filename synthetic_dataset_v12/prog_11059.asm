; DESCRIPTION: Places a magenta line segment connecting (465, 115) to (429, 145).
; PLAN: r0=465(x1), r1=115(y1), r2=429(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 115
LDI r2, 429
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

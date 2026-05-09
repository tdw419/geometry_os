; DESCRIPTION: Places a magenta line segment connecting (193, 185) to (389, 86).
; PLAN: r0=193(x1), r1=185(y1), r2=389(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 185
LDI r2, 389
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

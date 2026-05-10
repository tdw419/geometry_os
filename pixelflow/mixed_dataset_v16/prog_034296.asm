; DESCRIPTION: Draws a purple line from (45, 79) to (54, 132).
; PLAN: r0=45(x1), r1=79(y1), r2=54(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 79
LDI r2, 54
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (431, 134) to (78, 177).
; PLAN: r0=431(x1), r1=134(y1), r2=78(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 134
LDI r2, 78
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

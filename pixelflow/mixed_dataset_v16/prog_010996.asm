; DESCRIPTION: Draws a purple line from (77, 134) to (223, 77).
; PLAN: r0=77(x1), r1=134(y1), r2=223(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 134
LDI r2, 223
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

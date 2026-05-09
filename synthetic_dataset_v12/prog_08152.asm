; DESCRIPTION: Draws a magenta line from (138, 118) to (325, 217).
; PLAN: r0=138(x1), r1=118(y1), r2=325(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 118
LDI r2, 325
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

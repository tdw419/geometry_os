; DESCRIPTION: Draws a black line from (201, 217) to (357, 196).
; PLAN: r0=201(x1), r1=217(y1), r2=357(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 217
LDI r2, 357
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

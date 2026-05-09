; DESCRIPTION: Draws a purple line from (70, 102) to (129, 124).
; PLAN: r0=70(x1), r1=102(y1), r2=129(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 102
LDI r2, 129
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

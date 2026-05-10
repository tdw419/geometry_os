; DESCRIPTION: Draws a purple line from (388, 140) to (142, 152).
; PLAN: r0=388(x1), r1=140(y1), r2=142(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 140
LDI r2, 142
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

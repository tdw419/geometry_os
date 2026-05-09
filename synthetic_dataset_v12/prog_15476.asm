; DESCRIPTION: Draws a purple line from (56, 207) to (185, 69).
; PLAN: r0=56(x1), r1=207(y1), r2=185(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 207
LDI r2, 185
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

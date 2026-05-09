; DESCRIPTION: Draws a purple line from (185, 5) to (13, 182).
; PLAN: r0=185(x1), r1=5(y1), r2=13(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 5
LDI r2, 13
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

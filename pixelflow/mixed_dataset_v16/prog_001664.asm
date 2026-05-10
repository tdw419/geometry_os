; DESCRIPTION: Draws a purple line from (142, 65) to (402, 79).
; PLAN: r0=142(x1), r1=65(y1), r2=402(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 65
LDI r2, 402
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (169, 7) to (367, 226).
; PLAN: r0=169(x1), r1=7(y1), r2=367(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 7
LDI r2, 367
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

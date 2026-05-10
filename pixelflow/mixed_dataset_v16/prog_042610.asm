; DESCRIPTION: Draws a purple line from (457, 215) to (1, 119).
; PLAN: r0=457(x1), r1=215(y1), r2=1(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 215
LDI r2, 1
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (11, 86) to (64, 169).
; PLAN: r0=11(x1), r1=86(y1), r2=64(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 86
LDI r2, 64
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (208, 56) to (148, 180).
; PLAN: r0=208(x1), r1=56(y1), r2=148(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 56
LDI r2, 148
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

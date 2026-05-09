; DESCRIPTION: Draws a purple line from (162, 171) to (379, 99).
; PLAN: r0=162(x1), r1=171(y1), r2=379(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 171
LDI r2, 379
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

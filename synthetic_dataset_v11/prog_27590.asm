; DESCRIPTION: Draws a purple line from (70, 92) to (193, 123).
; PLAN: r0=70(x1), r1=92(y1), r2=193(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 92
LDI r2, 193
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

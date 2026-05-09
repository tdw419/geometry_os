; DESCRIPTION: Draws a purple line from (92, 65) to (94, 234).
; PLAN: r0=92(x1), r1=65(y1), r2=94(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 65
LDI r2, 94
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (357, 61) to (46, 73).
; PLAN: r0=357(x1), r1=61(y1), r2=46(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 61
LDI r2, 46
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

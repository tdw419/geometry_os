; DESCRIPTION: Draws a purple line from (106, 36) to (61, 46).
; PLAN: r0=106(x1), r1=36(y1), r2=61(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 36
LDI r2, 61
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

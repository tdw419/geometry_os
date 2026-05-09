; DESCRIPTION: Draws a purple line from (9, 57) to (73, 37).
; PLAN: r0=9(x1), r1=57(y1), r2=73(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 57
LDI r2, 73
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

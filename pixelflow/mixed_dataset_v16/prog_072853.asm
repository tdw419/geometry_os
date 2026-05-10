; DESCRIPTION: Draws a magenta line from (216, 218) to (86, 34).
; PLAN: r0=216(x1), r1=218(y1), r2=86(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 218
LDI r2, 86
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

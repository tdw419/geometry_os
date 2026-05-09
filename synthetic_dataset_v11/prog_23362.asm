; DESCRIPTION: Draws a yellow line from (216, 200) to (66, 216).
; PLAN: r0=216(x1), r1=200(y1), r2=66(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 200
LDI r2, 66
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

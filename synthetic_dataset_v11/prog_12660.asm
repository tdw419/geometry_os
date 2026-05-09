; DESCRIPTION: Draws a magenta line from (93, 94) to (9, 3).
; PLAN: r0=93(x1), r1=94(y1), r2=9(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 94
LDI r2, 9
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

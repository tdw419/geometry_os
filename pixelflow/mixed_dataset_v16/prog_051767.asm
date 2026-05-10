; DESCRIPTION: Draws a magenta line from (321, 23) to (4, 106).
; PLAN: r0=321(x1), r1=23(y1), r2=4(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 23
LDI r2, 4
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

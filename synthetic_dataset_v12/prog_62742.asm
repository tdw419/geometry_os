; DESCRIPTION: Draws a magenta line from (94, 254) to (321, 102).
; PLAN: r0=94(x1), r1=254(y1), r2=321(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 254
LDI r2, 321
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (3, 44) to (508, 159).
; PLAN: r0=3(x1), r1=44(y1), r2=508(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 44
LDI r2, 508
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

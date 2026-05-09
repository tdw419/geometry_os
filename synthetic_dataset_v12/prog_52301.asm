; DESCRIPTION: Draws a magenta line from (321, 26) to (119, 61).
; PLAN: r0=321(x1), r1=26(y1), r2=119(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 26
LDI r2, 119
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

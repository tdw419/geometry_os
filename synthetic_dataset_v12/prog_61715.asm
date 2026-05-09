; DESCRIPTION: Draws a magenta line from (345, 140) to (508, 223).
; PLAN: r0=345(x1), r1=140(y1), r2=508(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 140
LDI r2, 508
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

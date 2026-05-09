; DESCRIPTION: Draws a magenta line from (345, 97) to (293, 133).
; PLAN: r0=345(x1), r1=97(y1), r2=293(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 97
LDI r2, 293
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

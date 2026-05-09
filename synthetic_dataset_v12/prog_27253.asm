; DESCRIPTION: Draws a magenta line from (185, 64) to (159, 89).
; PLAN: r0=185(x1), r1=64(y1), r2=159(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 64
LDI r2, 159
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (283, 194) to (40, 159).
; PLAN: r0=283(x1), r1=194(y1), r2=40(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 194
LDI r2, 40
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

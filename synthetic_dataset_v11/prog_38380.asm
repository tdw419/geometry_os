; DESCRIPTION: Draws a magenta line from (17, 194) to (22, 199).
; PLAN: r0=17(x1), r1=194(y1), r2=22(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 194
LDI r2, 22
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

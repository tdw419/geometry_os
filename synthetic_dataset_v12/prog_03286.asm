; DESCRIPTION: Draws a magenta line from (71, 189) to (22, 199).
; PLAN: r0=71(x1), r1=189(y1), r2=22(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 189
LDI r2, 22
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

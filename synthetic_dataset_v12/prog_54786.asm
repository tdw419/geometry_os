; DESCRIPTION: Draws a magenta line from (358, 189) to (185, 170).
; PLAN: r0=358(x1), r1=189(y1), r2=185(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 189
LDI r2, 185
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

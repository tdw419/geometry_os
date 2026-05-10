; DESCRIPTION: Draws a magenta line from (276, 189) to (249, 7).
; PLAN: r0=276(x1), r1=189(y1), r2=249(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 189
LDI r2, 249
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

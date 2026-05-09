; DESCRIPTION: Draws a magenta line from (220, 33) to (461, 147).
; PLAN: r0=220(x1), r1=33(y1), r2=461(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 33
LDI r2, 461
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

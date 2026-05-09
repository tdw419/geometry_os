; DESCRIPTION: Draws a magenta line from (112, 214) to (107, 112).
; PLAN: r0=112(x1), r1=214(y1), r2=107(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 214
LDI r2, 107
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

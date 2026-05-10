; DESCRIPTION: Draws a magenta line from (51, 1) to (389, 112).
; PLAN: r0=51(x1), r1=1(y1), r2=389(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 1
LDI r2, 389
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (6, 28) to (200, 51).
; PLAN: r0=6(x1), r1=28(y1), r2=200(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 28
LDI r2, 200
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

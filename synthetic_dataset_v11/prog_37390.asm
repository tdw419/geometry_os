; DESCRIPTION: Draws a magenta line from (172, 51) to (6, 12).
; PLAN: r0=172(x1), r1=51(y1), r2=6(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 51
LDI r2, 6
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

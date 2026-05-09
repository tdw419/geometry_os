; DESCRIPTION: Draws a magenta line from (2, 98) to (51, 219).
; PLAN: r0=2(x1), r1=98(y1), r2=51(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 98
LDI r2, 51
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

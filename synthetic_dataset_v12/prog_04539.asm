; DESCRIPTION: Draws a magenta line from (247, 51) to (39, 121).
; PLAN: r0=247(x1), r1=51(y1), r2=39(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 51
LDI r2, 39
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

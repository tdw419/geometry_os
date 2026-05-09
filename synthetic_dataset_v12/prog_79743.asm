; DESCRIPTION: Draws a blue line from (99, 51) to (476, 177).
; PLAN: r0=99(x1), r1=51(y1), r2=476(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 51
LDI r2, 476
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

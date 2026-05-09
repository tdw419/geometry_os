; DESCRIPTION: Draws a magenta line from (15, 236) to (476, 217).
; PLAN: r0=15(x1), r1=236(y1), r2=476(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 236
LDI r2, 476
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

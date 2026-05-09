; DESCRIPTION: Draws a magenta line from (278, 51) to (415, 15).
; PLAN: r0=278(x1), r1=51(y1), r2=415(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 51
LDI r2, 415
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

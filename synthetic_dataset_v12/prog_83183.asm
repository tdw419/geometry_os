; DESCRIPTION: Draws a red line from (476, 81) to (59, 51).
; PLAN: r0=476(x1), r1=81(y1), r2=59(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 81
LDI r2, 59
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

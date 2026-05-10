; DESCRIPTION: Draws a red line from (328, 51) to (165, 175).
; PLAN: r0=328(x1), r1=51(y1), r2=165(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 51
LDI r2, 165
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

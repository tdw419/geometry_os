; DESCRIPTION: Draws a red line from (185, 230) to (132, 92).
; PLAN: r0=185(x1), r1=230(y1), r2=132(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 230
LDI r2, 132
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

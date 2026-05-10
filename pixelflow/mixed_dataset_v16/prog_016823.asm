; DESCRIPTION: Draws a red line from (152, 51) to (185, 106).
; PLAN: r0=152(x1), r1=51(y1), r2=185(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 51
LDI r2, 185
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

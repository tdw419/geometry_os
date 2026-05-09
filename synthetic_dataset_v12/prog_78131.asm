; DESCRIPTION: Draws a red line from (424, 216) to (120, 51).
; PLAN: r0=424(x1), r1=216(y1), r2=120(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 216
LDI r2, 120
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

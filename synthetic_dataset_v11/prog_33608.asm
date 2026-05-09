; DESCRIPTION: Draws a white line from (137, 216) to (47, 51).
; PLAN: r0=137(x1), r1=216(y1), r2=47(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 216
LDI r2, 47
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

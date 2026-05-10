; DESCRIPTION: Draws a white line from (147, 117) to (315, 124).
; PLAN: r0=147(x1), r1=117(y1), r2=315(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 117
LDI r2, 315
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

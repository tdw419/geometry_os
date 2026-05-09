; DESCRIPTION: Draws a blue line from (249, 137) to (486, 124).
; PLAN: r0=249(x1), r1=137(y1), r2=486(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 137
LDI r2, 486
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

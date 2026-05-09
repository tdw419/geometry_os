; DESCRIPTION: Draws a yellow line from (486, 51) to (455, 203).
; PLAN: r0=486(x1), r1=51(y1), r2=455(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 51
LDI r2, 455
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

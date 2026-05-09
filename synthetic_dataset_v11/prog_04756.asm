; DESCRIPTION: Draws a yellow line from (91, 199) to (51, 216).
; PLAN: r0=91(x1), r1=199(y1), r2=51(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 199
LDI r2, 51
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

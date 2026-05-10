; DESCRIPTION: Draws a yellow line from (177, 51) to (26, 12).
; PLAN: r0=177(x1), r1=51(y1), r2=26(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 51
LDI r2, 26
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

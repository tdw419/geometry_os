; DESCRIPTION: Draws a red line from (15, 99) to (51, 199).
; PLAN: r0=15(x1), r1=99(y1), r2=51(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 99
LDI r2, 51
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

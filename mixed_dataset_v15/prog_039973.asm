; DESCRIPTION: Draws a red line from (151, 155) to (230, 66).
; PLAN: r0=151(x1), r1=155(y1), r2=230(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 155
LDI r2, 230
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

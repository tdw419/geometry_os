; DESCRIPTION: Draws a red line from (155, 114) to (277, 4).
; PLAN: r0=155(x1), r1=114(y1), r2=277(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 114
LDI r2, 277
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

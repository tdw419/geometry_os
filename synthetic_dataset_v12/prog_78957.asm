; DESCRIPTION: Draws a yellow line from (118, 107) to (185, 25).
; PLAN: r0=118(x1), r1=107(y1), r2=185(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 107
LDI r2, 185
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

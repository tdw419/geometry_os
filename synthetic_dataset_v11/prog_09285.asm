; DESCRIPTION: Draws a yellow line from (118, 137) to (194, 171).
; PLAN: r0=118(x1), r1=137(y1), r2=194(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 137
LDI r2, 194
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

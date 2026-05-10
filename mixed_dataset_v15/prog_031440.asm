; DESCRIPTION: Draws a red line from (303, 118) to (253, 227).
; PLAN: r0=303(x1), r1=118(y1), r2=253(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 118
LDI r2, 253
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

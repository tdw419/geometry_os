; DESCRIPTION: Draws a white line from (238, 118) to (260, 58).
; PLAN: r0=238(x1), r1=118(y1), r2=260(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 118
LDI r2, 260
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

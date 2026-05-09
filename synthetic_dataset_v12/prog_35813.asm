; DESCRIPTION: Draws a black line from (118, 140) to (287, 124).
; PLAN: r0=118(x1), r1=140(y1), r2=287(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 140
LDI r2, 287
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red line from (30, 227) to (237, 2).
; PLAN: r0=30(x1), r1=227(y1), r2=237(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 227
LDI r2, 237
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (158, 34) to (4, 129).
; PLAN: r0=158(x1), r1=34(y1), r2=4(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 34
LDI r2, 4
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

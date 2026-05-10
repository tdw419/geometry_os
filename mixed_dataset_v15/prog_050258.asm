; DESCRIPTION: Renders a black line between points (227, 158) and (259, 207).
; PLAN: r0=227(x1), r1=158(y1), r2=259(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 158
LDI r2, 259
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

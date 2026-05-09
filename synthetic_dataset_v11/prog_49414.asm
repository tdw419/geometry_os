; DESCRIPTION: Renders a black line between points (123, 89) and (139, 202).
; PLAN: r0=123(x1), r1=89(y1), r2=139(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 89
LDI r2, 139
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

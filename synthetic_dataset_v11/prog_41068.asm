; DESCRIPTION: Renders a black line between points (34, 99) and (34, 182).
; PLAN: r0=34(x1), r1=99(y1), r2=34(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 99
LDI r2, 34
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

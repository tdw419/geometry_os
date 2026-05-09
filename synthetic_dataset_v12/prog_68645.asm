; DESCRIPTION: Renders a black line between points (339, 163) and (11, 47).
; PLAN: r0=339(x1), r1=163(y1), r2=11(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 163
LDI r2, 11
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

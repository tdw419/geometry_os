; DESCRIPTION: Renders a black line between points (141, 57) and (333, 163).
; PLAN: r0=141(x1), r1=57(y1), r2=333(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 57
LDI r2, 333
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

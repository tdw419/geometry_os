; DESCRIPTION: Renders a black line between points (141, 23) and (202, 15).
; PLAN: r0=141(x1), r1=23(y1), r2=202(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 23
LDI r2, 202
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

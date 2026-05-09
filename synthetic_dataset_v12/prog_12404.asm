; DESCRIPTION: Renders a black line between points (508, 175) and (31, 168).
; PLAN: r0=508(x1), r1=175(y1), r2=31(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 175
LDI r2, 31
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

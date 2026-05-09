; DESCRIPTION: Renders a black line between points (334, 229) and (93, 196).
; PLAN: r0=334(x1), r1=229(y1), r2=93(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 229
LDI r2, 93
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

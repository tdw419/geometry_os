; DESCRIPTION: Renders a black line between points (99, 92) and (9, 30).
; PLAN: r0=99(x1), r1=92(y1), r2=9(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 92
LDI r2, 9
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

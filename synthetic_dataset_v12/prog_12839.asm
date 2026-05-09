; DESCRIPTION: Renders a black line between points (151, 101) and (18, 15).
; PLAN: r0=151(x1), r1=101(y1), r2=18(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 101
LDI r2, 18
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (3, 151) and (34, 84).
; PLAN: r0=3(x1), r1=151(y1), r2=34(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 151
LDI r2, 34
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

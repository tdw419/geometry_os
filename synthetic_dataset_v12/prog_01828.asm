; DESCRIPTION: Renders a black line between points (321, 61) and (406, 116).
; PLAN: r0=321(x1), r1=61(y1), r2=406(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 61
LDI r2, 406
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

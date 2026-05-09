; DESCRIPTION: Renders a black line between points (466, 87) and (14, 181).
; PLAN: r0=466(x1), r1=87(y1), r2=14(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 87
LDI r2, 14
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

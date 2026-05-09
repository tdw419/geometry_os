; DESCRIPTION: Renders a black line between points (85, 47) and (136, 44).
; PLAN: r0=85(x1), r1=47(y1), r2=136(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 47
LDI r2, 136
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

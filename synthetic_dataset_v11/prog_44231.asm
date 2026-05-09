; DESCRIPTION: Renders a black line between points (110, 44) and (216, 71).
; PLAN: r0=110(x1), r1=44(y1), r2=216(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 44
LDI r2, 216
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

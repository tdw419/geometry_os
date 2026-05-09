; DESCRIPTION: Renders a black line between points (249, 119) and (39, 44).
; PLAN: r0=249(x1), r1=119(y1), r2=39(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 119
LDI r2, 39
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

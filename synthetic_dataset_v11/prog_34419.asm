; DESCRIPTION: Renders a black line between points (149, 44) and (31, 45).
; PLAN: r0=149(x1), r1=44(y1), r2=31(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 44
LDI r2, 31
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

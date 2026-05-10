; DESCRIPTION: Renders a black line between points (129, 138) and (87, 84).
; PLAN: r0=129(x1), r1=138(y1), r2=87(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 138
LDI r2, 87
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

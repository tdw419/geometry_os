; DESCRIPTION: Renders a black line between points (234, 83) and (3, 138).
; PLAN: r0=234(x1), r1=83(y1), r2=3(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 83
LDI r2, 3
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

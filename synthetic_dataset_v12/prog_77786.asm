; DESCRIPTION: Renders a black line between points (345, 234) and (99, 43).
; PLAN: r0=345(x1), r1=234(y1), r2=99(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 234
LDI r2, 99
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (22, 13) and (6, 46).
; PLAN: r0=22(x1), r1=13(y1), r2=6(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 13
LDI r2, 6
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

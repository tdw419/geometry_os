; DESCRIPTION: Renders a black line between points (182, 99) and (393, 130).
; PLAN: r0=182(x1), r1=99(y1), r2=393(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 99
LDI r2, 393
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

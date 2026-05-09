; DESCRIPTION: Renders a black line between points (81, 18) and (130, 49).
; PLAN: r0=81(x1), r1=18(y1), r2=130(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 18
LDI r2, 130
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

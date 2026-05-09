; DESCRIPTION: Renders a black line between points (3, 96) and (130, 81).
; PLAN: r0=3(x1), r1=96(y1), r2=130(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 96
LDI r2, 130
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

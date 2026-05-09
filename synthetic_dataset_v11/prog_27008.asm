; DESCRIPTION: Renders a black line between points (18, 65) and (137, 165).
; PLAN: r0=18(x1), r1=65(y1), r2=137(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 65
LDI r2, 137
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

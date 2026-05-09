; DESCRIPTION: Renders a black line between points (45, 246) and (22, 51).
; PLAN: r0=45(x1), r1=246(y1), r2=22(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 246
LDI r2, 22
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

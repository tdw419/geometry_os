; DESCRIPTION: Renders a black line between points (306, 1) and (139, 126).
; PLAN: r0=306(x1), r1=1(y1), r2=139(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 1
LDI r2, 139
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

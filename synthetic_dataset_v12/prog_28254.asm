; DESCRIPTION: Renders a black line between points (309, 66) and (495, 102).
; PLAN: r0=309(x1), r1=66(y1), r2=495(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 66
LDI r2, 495
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

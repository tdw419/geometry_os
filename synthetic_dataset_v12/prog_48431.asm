; DESCRIPTION: Renders a black line between points (368, 91) and (378, 80).
; PLAN: r0=368(x1), r1=91(y1), r2=378(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 91
LDI r2, 378
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

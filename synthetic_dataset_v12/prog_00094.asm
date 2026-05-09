; DESCRIPTION: Renders a black line between points (378, 20) and (39, 109).
; PLAN: r0=378(x1), r1=20(y1), r2=39(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 20
LDI r2, 39
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

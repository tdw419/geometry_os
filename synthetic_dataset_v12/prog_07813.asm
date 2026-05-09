; DESCRIPTION: Renders a black line between points (466, 106) and (264, 200).
; PLAN: r0=466(x1), r1=106(y1), r2=264(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 106
LDI r2, 264
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

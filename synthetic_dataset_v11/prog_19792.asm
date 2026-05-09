; DESCRIPTION: Renders a black line between points (75, 200) and (248, 100).
; PLAN: r0=75(x1), r1=200(y1), r2=248(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 200
LDI r2, 248
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

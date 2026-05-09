; DESCRIPTION: Renders a black line between points (226, 50) and (251, 34).
; PLAN: r0=226(x1), r1=50(y1), r2=251(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 50
LDI r2, 251
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

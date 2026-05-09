; DESCRIPTION: Renders a black line between points (157, 182) and (110, 90).
; PLAN: r0=157(x1), r1=182(y1), r2=110(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 182
LDI r2, 110
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

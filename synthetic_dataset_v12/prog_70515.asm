; DESCRIPTION: Renders a blue line between points (260, 182) and (306, 80).
; PLAN: r0=260(x1), r1=182(y1), r2=306(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 182
LDI r2, 306
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

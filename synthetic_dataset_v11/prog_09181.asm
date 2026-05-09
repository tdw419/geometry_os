; DESCRIPTION: Renders a yellow line between points (194, 182) and (110, 144).
; PLAN: r0=194(x1), r1=182(y1), r2=110(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 182
LDI r2, 110
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

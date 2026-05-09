; DESCRIPTION: Renders a yellow line between points (164, 182) and (342, 211).
; PLAN: r0=164(x1), r1=182(y1), r2=342(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 182
LDI r2, 342
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

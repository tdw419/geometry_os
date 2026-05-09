; DESCRIPTION: Renders a yellow line between points (125, 182) and (186, 143).
; PLAN: r0=125(x1), r1=182(y1), r2=186(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 182
LDI r2, 186
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow line between points (146, 182) and (29, 233).
; PLAN: r0=146(x1), r1=182(y1), r2=29(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 182
LDI r2, 29
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

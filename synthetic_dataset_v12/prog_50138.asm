; DESCRIPTION: Renders a yellow line between points (92, 182) and (141, 184).
; PLAN: r0=92(x1), r1=182(y1), r2=141(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 182
LDI r2, 141
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow line segment connecting (198, 182) to (341, 181).
; PLAN: r0=198(x1), r1=182(y1), r2=341(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 182
LDI r2, 341
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

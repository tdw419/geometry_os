; DESCRIPTION: Places a red line segment connecting (74, 182) to (341, 114).
; PLAN: r0=74(x1), r1=182(y1), r2=341(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 182
LDI r2, 341
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

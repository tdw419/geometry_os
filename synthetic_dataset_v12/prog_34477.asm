; DESCRIPTION: Renders a yellow line between points (341, 143) and (475, 114).
; PLAN: r0=341(x1), r1=143(y1), r2=475(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 143
LDI r2, 475
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

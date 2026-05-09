; DESCRIPTION: Renders a purple line between points (27, 182) and (134, 157).
; PLAN: r0=27(x1), r1=182(y1), r2=134(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 182
LDI r2, 134
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

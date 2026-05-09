; DESCRIPTION: Renders a purple line between points (34, 221) and (236, 114).
; PLAN: r0=34(x1), r1=221(y1), r2=236(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 221
LDI r2, 236
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

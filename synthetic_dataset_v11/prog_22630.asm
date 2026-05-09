; DESCRIPTION: Renders a purple line between points (75, 115) and (246, 221).
; PLAN: r0=75(x1), r1=115(y1), r2=246(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 115
LDI r2, 246
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

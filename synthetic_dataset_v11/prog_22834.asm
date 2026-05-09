; DESCRIPTION: Renders a purple line between points (179, 81) and (154, 12).
; PLAN: r0=179(x1), r1=81(y1), r2=154(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 81
LDI r2, 154
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

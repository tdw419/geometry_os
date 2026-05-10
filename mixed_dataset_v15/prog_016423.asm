; DESCRIPTION: Renders a purple line between points (53, 197) and (124, 154).
; PLAN: r0=53(x1), r1=197(y1), r2=124(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 197
LDI r2, 124
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

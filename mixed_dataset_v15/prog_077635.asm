; DESCRIPTION: Renders a magenta line between points (93, 104) and (114, 153).
; PLAN: r0=93(x1), r1=104(y1), r2=114(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 104
LDI r2, 114
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

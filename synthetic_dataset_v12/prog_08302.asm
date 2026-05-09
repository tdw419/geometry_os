; DESCRIPTION: Renders a magenta line between points (478, 114) and (259, 60).
; PLAN: r0=478(x1), r1=114(y1), r2=259(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 114
LDI r2, 259
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

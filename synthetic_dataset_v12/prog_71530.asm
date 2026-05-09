; DESCRIPTION: Renders a green line between points (170, 158) and (140, 53).
; PLAN: r0=170(x1), r1=158(y1), r2=140(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 158
LDI r2, 140
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow line between points (139, 2) and (416, 66).
; PLAN: r0=139(x1), r1=2(y1), r2=416(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 2
LDI r2, 416
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

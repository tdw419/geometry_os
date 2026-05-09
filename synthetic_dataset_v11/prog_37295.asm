; DESCRIPTION: Renders a yellow line between points (141, 97) and (170, 82).
; PLAN: r0=141(x1), r1=97(y1), r2=170(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 97
LDI r2, 170
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

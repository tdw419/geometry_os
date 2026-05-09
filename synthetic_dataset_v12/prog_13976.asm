; DESCRIPTION: Renders a yellow line between points (107, 82) and (216, 102).
; PLAN: r0=107(x1), r1=82(y1), r2=216(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 82
LDI r2, 216
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

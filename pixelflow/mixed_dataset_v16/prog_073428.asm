; DESCRIPTION: Renders a yellow line between points (221, 65) and (478, 221).
; PLAN: r0=221(x1), r1=65(y1), r2=478(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 65
LDI r2, 478
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

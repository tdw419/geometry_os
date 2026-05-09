; DESCRIPTION: Renders a yellow line between points (391, 21) and (141, 251).
; PLAN: r0=391(x1), r1=21(y1), r2=141(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 21
LDI r2, 141
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (341, 86) and (91, 197).
; PLAN: r0=341(x1), r1=86(y1), r2=91(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 86
LDI r2, 91
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

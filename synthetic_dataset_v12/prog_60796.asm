; DESCRIPTION: Renders a red line between points (508, 86) and (258, 17).
; PLAN: r0=508(x1), r1=86(y1), r2=258(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 86
LDI r2, 258
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

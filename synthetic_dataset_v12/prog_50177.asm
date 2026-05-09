; DESCRIPTION: Renders a white line between points (137, 117) and (163, 122).
; PLAN: r0=137(x1), r1=117(y1), r2=163(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 117
LDI r2, 163
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

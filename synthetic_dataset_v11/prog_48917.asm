; DESCRIPTION: Renders a white line between points (13, 170) and (193, 141).
; PLAN: r0=13(x1), r1=170(y1), r2=193(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 170
LDI r2, 193
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

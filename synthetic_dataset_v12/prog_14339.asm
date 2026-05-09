; DESCRIPTION: Renders a white line between points (449, 185) and (155, 102).
; PLAN: r0=449(x1), r1=185(y1), r2=155(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 185
LDI r2, 155
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

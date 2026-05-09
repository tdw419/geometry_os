; DESCRIPTION: Renders a yellow line between points (83, 251) and (33, 207).
; PLAN: r0=83(x1), r1=251(y1), r2=33(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 251
LDI r2, 33
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

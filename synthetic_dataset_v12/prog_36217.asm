; DESCRIPTION: Renders a black line between points (205, 201) and (356, 102).
; PLAN: r0=205(x1), r1=201(y1), r2=356(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 201
LDI r2, 356
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (236, 129) and (107, 201).
; PLAN: r0=236(x1), r1=129(y1), r2=107(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 129
LDI r2, 107
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

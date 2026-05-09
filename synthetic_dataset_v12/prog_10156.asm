; DESCRIPTION: Renders a red line between points (128, 201) and (354, 148).
; PLAN: r0=128(x1), r1=201(y1), r2=354(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 201
LDI r2, 354
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

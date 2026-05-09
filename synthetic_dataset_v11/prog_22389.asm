; DESCRIPTION: Renders a green line between points (125, 173) and (247, 201).
; PLAN: r0=125(x1), r1=173(y1), r2=247(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 173
LDI r2, 247
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (129, 163) and (257, 99).
; PLAN: r0=129(x1), r1=163(y1), r2=257(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 163
LDI r2, 257
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

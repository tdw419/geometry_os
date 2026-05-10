; DESCRIPTION: Renders a cyan line between points (418, 163) and (402, 118).
; PLAN: r0=418(x1), r1=163(y1), r2=402(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 163
LDI r2, 402
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

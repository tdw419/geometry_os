; DESCRIPTION: Renders a cyan line between points (163, 218) and (93, 170).
; PLAN: r0=163(x1), r1=218(y1), r2=93(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 218
LDI r2, 93
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

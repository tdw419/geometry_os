; DESCRIPTION: Renders a purple line between points (483, 129) and (439, 139).
; PLAN: r0=483(x1), r1=129(y1), r2=439(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 129
LDI r2, 439
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

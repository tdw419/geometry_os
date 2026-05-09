; DESCRIPTION: Renders a white line between points (483, 93) and (388, 223).
; PLAN: r0=483(x1), r1=93(y1), r2=388(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 93
LDI r2, 388
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

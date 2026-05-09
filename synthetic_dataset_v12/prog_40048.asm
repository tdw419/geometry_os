; DESCRIPTION: Renders a black line between points (506, 93) and (462, 139).
; PLAN: r0=506(x1), r1=93(y1), r2=462(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 93
LDI r2, 462
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (55, 105) and (93, 27).
; PLAN: r0=55(x1), r1=105(y1), r2=93(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 105
LDI r2, 93
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

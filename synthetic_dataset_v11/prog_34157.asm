; DESCRIPTION: Renders a green line between points (93, 43) and (39, 217).
; PLAN: r0=93(x1), r1=43(y1), r2=39(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 43
LDI r2, 39
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

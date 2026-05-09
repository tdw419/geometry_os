; DESCRIPTION: Renders a green line between points (119, 74) and (159, 23).
; PLAN: r0=119(x1), r1=74(y1), r2=159(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 74
LDI r2, 159
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

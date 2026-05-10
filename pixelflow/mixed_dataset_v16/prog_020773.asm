; DESCRIPTION: Renders a yellow line between points (159, 7) and (299, 106).
; PLAN: r0=159(x1), r1=7(y1), r2=299(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 7
LDI r2, 299
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

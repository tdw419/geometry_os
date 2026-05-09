; DESCRIPTION: Renders a green line between points (159, 160) and (194, 28).
; PLAN: r0=159(x1), r1=160(y1), r2=194(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 160
LDI r2, 194
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (159, 116) and (141, 121).
; PLAN: r0=159(x1), r1=116(y1), r2=141(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 116
LDI r2, 141
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (159, 248) and (135, 53).
; PLAN: r0=159(x1), r1=248(y1), r2=135(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 248
LDI r2, 135
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

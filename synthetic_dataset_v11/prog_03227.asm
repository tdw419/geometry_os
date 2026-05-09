; DESCRIPTION: Renders a green line between points (81, 234) and (139, 78).
; PLAN: r0=81(x1), r1=234(y1), r2=139(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 234
LDI r2, 139
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

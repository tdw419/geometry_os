; DESCRIPTION: Renders a purple line between points (55, 234) and (184, 177).
; PLAN: r0=55(x1), r1=234(y1), r2=184(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 234
LDI r2, 184
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

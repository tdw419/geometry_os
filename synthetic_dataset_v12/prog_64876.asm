; DESCRIPTION: Renders a blue line between points (496, 46) and (116, 20).
; PLAN: r0=496(x1), r1=46(y1), r2=116(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 46
LDI r2, 116
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

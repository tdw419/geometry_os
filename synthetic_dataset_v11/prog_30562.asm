; DESCRIPTION: Renders a blue line between points (14, 26) and (5, 81).
; PLAN: r0=14(x1), r1=26(y1), r2=5(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 26
LDI r2, 5
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

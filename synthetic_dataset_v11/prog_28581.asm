; DESCRIPTION: Renders a purple line between points (25, 76) and (161, 91).
; PLAN: r0=25(x1), r1=76(y1), r2=161(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 76
LDI r2, 161
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

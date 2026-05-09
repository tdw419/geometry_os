; DESCRIPTION: Renders a purple line between points (223, 46) and (456, 91).
; PLAN: r0=223(x1), r1=46(y1), r2=456(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 46
LDI r2, 456
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

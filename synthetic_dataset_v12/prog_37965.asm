; DESCRIPTION: Renders a blue line between points (47, 46) and (76, 25).
; PLAN: r0=47(x1), r1=46(y1), r2=76(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 46
LDI r2, 76
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

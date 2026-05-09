; DESCRIPTION: Renders a blue line between points (380, 185) and (118, 149).
; PLAN: r0=380(x1), r1=185(y1), r2=118(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 185
LDI r2, 118
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

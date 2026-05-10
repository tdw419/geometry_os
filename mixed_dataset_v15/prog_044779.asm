; DESCRIPTION: Renders a blue line between points (300, 15) and (238, 109).
; PLAN: r0=300(x1), r1=15(y1), r2=238(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 15
LDI r2, 238
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (219, 75) and (238, 24).
; PLAN: r0=219(x1), r1=75(y1), r2=238(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 75
LDI r2, 238
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

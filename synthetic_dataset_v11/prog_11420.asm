; DESCRIPTION: Renders a blue line between points (11, 219) and (118, 38).
; PLAN: r0=11(x1), r1=219(y1), r2=118(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 219
LDI r2, 118
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

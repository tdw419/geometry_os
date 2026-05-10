; DESCRIPTION: Renders a blue line between points (261, 172) and (78, 110).
; PLAN: r0=261(x1), r1=172(y1), r2=78(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 172
LDI r2, 78
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

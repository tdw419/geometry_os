; DESCRIPTION: Renders a blue line between points (492, 122) and (153, 233).
; PLAN: r0=492(x1), r1=122(y1), r2=153(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 122
LDI r2, 153
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

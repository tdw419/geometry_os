; DESCRIPTION: Renders a blue line between points (124, 172) and (17, 21).
; PLAN: r0=124(x1), r1=172(y1), r2=17(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 172
LDI r2, 17
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

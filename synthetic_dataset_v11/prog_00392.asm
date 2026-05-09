; DESCRIPTION: Renders a blue line between points (19, 157) and (7, 135).
; PLAN: r0=19(x1), r1=157(y1), r2=7(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 157
LDI r2, 7
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

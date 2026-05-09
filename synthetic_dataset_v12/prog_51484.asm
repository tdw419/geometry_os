; DESCRIPTION: Renders a blue line between points (116, 244) and (19, 212).
; PLAN: r0=116(x1), r1=244(y1), r2=19(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 244
LDI r2, 19
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

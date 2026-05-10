; DESCRIPTION: Renders a purple line segment connecting (238, 19) to (299, 59).
; PLAN: r0=238(x1), r1=19(y1), r2=299(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 19
LDI r2, 299
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

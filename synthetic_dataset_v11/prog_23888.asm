; DESCRIPTION: Renders a blue line between points (67, 163) and (170, 31).
; PLAN: r0=67(x1), r1=163(y1), r2=170(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 163
LDI r2, 170
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

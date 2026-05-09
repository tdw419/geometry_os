; DESCRIPTION: Renders a blue line between points (151, 0) and (355, 71).
; PLAN: r0=151(x1), r1=0(y1), r2=355(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 0
LDI r2, 355
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

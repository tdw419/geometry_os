; DESCRIPTION: Renders a blue line between points (313, 61) and (315, 139).
; PLAN: r0=313(x1), r1=61(y1), r2=315(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 61
LDI r2, 315
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

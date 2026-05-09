; DESCRIPTION: Renders a blue line between points (38, 108) and (94, 139).
; PLAN: r0=38(x1), r1=108(y1), r2=94(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 108
LDI r2, 94
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

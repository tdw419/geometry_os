; DESCRIPTION: Renders a blue line between points (94, 92) and (139, 236).
; PLAN: r0=94(x1), r1=92(y1), r2=139(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 92
LDI r2, 139
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

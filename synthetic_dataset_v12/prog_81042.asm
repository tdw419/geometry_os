; DESCRIPTION: Renders a blue line between points (297, 129) and (336, 49).
; PLAN: r0=297(x1), r1=129(y1), r2=336(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 129
LDI r2, 336
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

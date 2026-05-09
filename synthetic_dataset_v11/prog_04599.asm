; DESCRIPTION: Renders a blue line between points (232, 129) and (199, 61).
; PLAN: r0=232(x1), r1=129(y1), r2=199(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 129
LDI r2, 199
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (379, 240) and (74, 34).
; PLAN: r0=379(x1), r1=240(y1), r2=74(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 240
LDI r2, 74
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (92, 52) and (477, 33).
; PLAN: r0=92(x1), r1=52(y1), r2=477(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 52
LDI r2, 477
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

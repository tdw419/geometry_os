; DESCRIPTION: Renders a blue line between points (486, 61) and (238, 178).
; PLAN: r0=486(x1), r1=61(y1), r2=238(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 61
LDI r2, 238
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

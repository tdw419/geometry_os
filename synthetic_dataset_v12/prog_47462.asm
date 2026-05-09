; DESCRIPTION: Renders a blue line between points (460, 238) and (349, 251).
; PLAN: r0=460(x1), r1=238(y1), r2=349(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 238
LDI r2, 349
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

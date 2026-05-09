; DESCRIPTION: Renders a purple line between points (181, 238) and (243, 94).
; PLAN: r0=181(x1), r1=238(y1), r2=243(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 238
LDI r2, 243
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

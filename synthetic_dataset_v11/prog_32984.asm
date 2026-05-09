; DESCRIPTION: Renders a blue line between points (34, 122) and (226, 161).
; PLAN: r0=34(x1), r1=122(y1), r2=226(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 122
LDI r2, 226
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

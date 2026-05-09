; DESCRIPTION: Renders a blue line between points (410, 176) and (423, 34).
; PLAN: r0=410(x1), r1=176(y1), r2=423(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 176
LDI r2, 423
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

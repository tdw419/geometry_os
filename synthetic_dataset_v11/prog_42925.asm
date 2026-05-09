; DESCRIPTION: Renders a purple line between points (2, 171) and (40, 14).
; PLAN: r0=2(x1), r1=171(y1), r2=40(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 171
LDI r2, 40
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

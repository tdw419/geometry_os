; DESCRIPTION: Renders a blue line between points (90, 35) and (176, 14).
; PLAN: r0=90(x1), r1=35(y1), r2=176(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 35
LDI r2, 176
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

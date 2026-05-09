; DESCRIPTION: Renders a blue line between points (55, 60) and (446, 12).
; PLAN: r0=55(x1), r1=60(y1), r2=446(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 60
LDI r2, 446
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

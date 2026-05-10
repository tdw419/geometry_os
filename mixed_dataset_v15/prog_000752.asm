; DESCRIPTION: Renders a blue line between points (339, 4) and (150, 55).
; PLAN: r0=339(x1), r1=4(y1), r2=150(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 4
LDI r2, 150
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

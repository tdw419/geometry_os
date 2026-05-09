; DESCRIPTION: Renders a blue line between points (185, 174) and (230, 120).
; PLAN: r0=185(x1), r1=174(y1), r2=230(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 174
LDI r2, 230
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

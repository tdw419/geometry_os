; DESCRIPTION: Renders a blue line between points (388, 103) and (117, 230).
; PLAN: r0=388(x1), r1=103(y1), r2=117(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 103
LDI r2, 117
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

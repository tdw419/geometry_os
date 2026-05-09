; DESCRIPTION: Renders a blue line between points (193, 230) and (214, 53).
; PLAN: r0=193(x1), r1=230(y1), r2=214(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 230
LDI r2, 214
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

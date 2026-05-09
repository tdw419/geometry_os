; DESCRIPTION: Renders a blue line between points (92, 214) and (179, 216).
; PLAN: r0=92(x1), r1=214(y1), r2=179(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 214
LDI r2, 179
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

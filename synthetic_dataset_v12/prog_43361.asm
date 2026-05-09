; DESCRIPTION: Renders a blue line between points (258, 153) and (48, 92).
; PLAN: r0=258(x1), r1=153(y1), r2=48(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 153
LDI r2, 48
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

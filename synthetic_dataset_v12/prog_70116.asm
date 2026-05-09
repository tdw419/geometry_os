; DESCRIPTION: Renders a blue line between points (327, 61) and (332, 88).
; PLAN: r0=327(x1), r1=61(y1), r2=332(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 61
LDI r2, 332
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

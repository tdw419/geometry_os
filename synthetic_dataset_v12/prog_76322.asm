; DESCRIPTION: Renders a blue line between points (76, 251) and (214, 40).
; PLAN: r0=76(x1), r1=251(y1), r2=214(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 251
LDI r2, 214
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

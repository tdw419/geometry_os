; DESCRIPTION: Renders a blue line between points (248, 215) and (76, 181).
; PLAN: r0=248(x1), r1=215(y1), r2=76(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 215
LDI r2, 76
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

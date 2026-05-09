; DESCRIPTION: Renders a blue line between points (238, 181) and (32, 149).
; PLAN: r0=238(x1), r1=181(y1), r2=32(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 181
LDI r2, 32
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

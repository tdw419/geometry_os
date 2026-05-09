; DESCRIPTION: Renders a green line between points (349, 181) and (379, 237).
; PLAN: r0=349(x1), r1=181(y1), r2=379(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 181
LDI r2, 379
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

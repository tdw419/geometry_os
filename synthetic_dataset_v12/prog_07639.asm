; DESCRIPTION: Places a blue line segment connecting (336, 215) to (304, 251).
; PLAN: r0=336(x1), r1=215(y1), r2=304(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 215
LDI r2, 304
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

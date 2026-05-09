; DESCRIPTION: Places a blue line segment connecting (234, 221) to (93, 176).
; PLAN: r0=234(x1), r1=221(y1), r2=93(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 221
LDI r2, 93
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

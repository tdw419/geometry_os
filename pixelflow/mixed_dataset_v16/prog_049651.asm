; DESCRIPTION: Places a blue line segment connecting (418, 62) to (429, 133).
; PLAN: r0=418(x1), r1=62(y1), r2=429(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 62
LDI r2, 429
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

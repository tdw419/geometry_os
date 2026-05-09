; DESCRIPTION: Places a blue line segment connecting (234, 245) to (143, 197).
; PLAN: r0=234(x1), r1=245(y1), r2=143(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 245
LDI r2, 143
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (408, 195) to (149, 224).
; PLAN: r0=408(x1), r1=195(y1), r2=149(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 195
LDI r2, 149
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (442, 114) to (76, 133).
; PLAN: r0=442(x1), r1=114(y1), r2=76(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 114
LDI r2, 76
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

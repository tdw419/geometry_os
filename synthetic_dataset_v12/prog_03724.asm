; DESCRIPTION: Places a yellow line segment connecting (300, 231) to (421, 142).
; PLAN: r0=300(x1), r1=231(y1), r2=421(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 231
LDI r2, 421
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

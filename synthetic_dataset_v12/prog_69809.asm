; DESCRIPTION: Places a blue line segment connecting (372, 58) to (269, 76).
; PLAN: r0=372(x1), r1=58(y1), r2=269(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 58
LDI r2, 269
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

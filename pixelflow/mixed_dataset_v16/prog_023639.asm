; DESCRIPTION: Places a blue line segment connecting (409, 48) to (439, 11).
; PLAN: r0=409(x1), r1=48(y1), r2=439(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 48
LDI r2, 439
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

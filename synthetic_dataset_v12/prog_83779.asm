; DESCRIPTION: Places a blue line segment connecting (27, 128) to (422, 62).
; PLAN: r0=27(x1), r1=128(y1), r2=422(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 128
LDI r2, 422
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

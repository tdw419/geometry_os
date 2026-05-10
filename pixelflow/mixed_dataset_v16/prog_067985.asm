; DESCRIPTION: Places a blue line segment connecting (367, 237) to (409, 36).
; PLAN: r0=367(x1), r1=237(y1), r2=409(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 237
LDI r2, 409
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

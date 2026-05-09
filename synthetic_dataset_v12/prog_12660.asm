; DESCRIPTION: Places a blue line segment connecting (409, 73) to (280, 21).
; PLAN: r0=409(x1), r1=73(y1), r2=280(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 73
LDI r2, 280
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

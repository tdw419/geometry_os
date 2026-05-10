; DESCRIPTION: Places a blue line segment connecting (409, 98) to (79, 64).
; PLAN: r0=409(x1), r1=98(y1), r2=79(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 98
LDI r2, 79
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

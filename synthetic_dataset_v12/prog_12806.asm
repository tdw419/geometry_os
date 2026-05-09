; DESCRIPTION: Places a blue line segment connecting (422, 108) to (292, 52).
; PLAN: r0=422(x1), r1=108(y1), r2=292(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 108
LDI r2, 292
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

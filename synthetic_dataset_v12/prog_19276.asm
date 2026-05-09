; DESCRIPTION: Places a orange line segment connecting (422, 188) to (92, 238).
; PLAN: r0=422(x1), r1=188(y1), r2=92(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 188
LDI r2, 92
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

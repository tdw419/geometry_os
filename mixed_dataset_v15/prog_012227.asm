; DESCRIPTION: Places a orange line segment connecting (422, 144) to (19, 223).
; PLAN: r0=422(x1), r1=144(y1), r2=19(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 144
LDI r2, 19
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

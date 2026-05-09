; DESCRIPTION: Places a orange line segment connecting (63, 204) to (19, 60).
; PLAN: r0=63(x1), r1=204(y1), r2=19(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 204
LDI r2, 19
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

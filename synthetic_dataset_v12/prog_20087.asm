; DESCRIPTION: Places a orange line segment connecting (422, 93) to (202, 122).
; PLAN: r0=422(x1), r1=93(y1), r2=202(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 93
LDI r2, 202
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

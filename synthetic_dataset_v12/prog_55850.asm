; DESCRIPTION: Renders a orange line between points (409, 226) and (347, 60).
; PLAN: r0=409(x1), r1=226(y1), r2=347(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 226
LDI r2, 347
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (422, 59) to (137, 200).
; PLAN: r0=422(x1), r1=59(y1), r2=137(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 59
LDI r2, 137
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

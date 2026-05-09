; DESCRIPTION: Draws a orange line from (271, 174) to (422, 21).
; PLAN: r0=271(x1), r1=174(y1), r2=422(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 174
LDI r2, 422
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (304, 198) to (422, 231).
; PLAN: r0=304(x1), r1=198(y1), r2=422(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 198
LDI r2, 422
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

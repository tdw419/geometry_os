; DESCRIPTION: Draws a orange line from (209, 254) to (422, 37).
; PLAN: r0=209(x1), r1=254(y1), r2=422(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 254
LDI r2, 422
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

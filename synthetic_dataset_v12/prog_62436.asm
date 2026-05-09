; DESCRIPTION: Draws a green line from (422, 241) to (454, 181).
; PLAN: r0=422(x1), r1=241(y1), r2=454(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 241
LDI r2, 454
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

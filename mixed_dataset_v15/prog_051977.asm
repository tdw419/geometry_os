; DESCRIPTION: Draws a yellow line from (418, 78) to (422, 157).
; PLAN: r0=418(x1), r1=78(y1), r2=422(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 78
LDI r2, 422
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

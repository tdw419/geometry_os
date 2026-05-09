; DESCRIPTION: Draws a black line from (163, 2) to (422, 191).
; PLAN: r0=163(x1), r1=2(y1), r2=422(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 2
LDI r2, 422
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

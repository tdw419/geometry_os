; DESCRIPTION: Draws a black line from (422, 100) to (212, 116).
; PLAN: r0=422(x1), r1=100(y1), r2=212(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 100
LDI r2, 212
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

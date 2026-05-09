; DESCRIPTION: Draws a purple line from (422, 58) to (498, 159).
; PLAN: r0=422(x1), r1=58(y1), r2=498(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 58
LDI r2, 498
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

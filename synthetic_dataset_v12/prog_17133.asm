; DESCRIPTION: Draws a black line from (94, 188) to (422, 183).
; PLAN: r0=94(x1), r1=188(y1), r2=422(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 188
LDI r2, 422
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

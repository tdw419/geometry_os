; DESCRIPTION: Draws a black line from (422, 237) to (21, 137).
; PLAN: r0=422(x1), r1=237(y1), r2=21(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 237
LDI r2, 21
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

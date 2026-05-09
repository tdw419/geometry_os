; DESCRIPTION: Draws a black line from (49, 141) to (422, 237).
; PLAN: r0=49(x1), r1=141(y1), r2=422(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 141
LDI r2, 422
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

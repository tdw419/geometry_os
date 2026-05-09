; DESCRIPTION: Draws a black line from (237, 217) to (469, 183).
; PLAN: r0=237(x1), r1=217(y1), r2=469(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 217
LDI r2, 469
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (418, 201) to (397, 189).
; PLAN: r0=418(x1), r1=201(y1), r2=397(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 201
LDI r2, 397
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
